#!/bin/bash

# Check dependecies
SOFTWARES="wc awk sed mkdir wget unzip docker"
for SOFTWARE in ${SOFTWARES}; do
	if [[ ! -f $(which ${SOFTWARE}) ]]; then
		echo " Please, install ${SOFTWARE} and try again!"
		exit 1
	fi
done

# Set variables
DIR_WORK=$( cd $(dirname $0) ; pwd)
DIR_ISTAT=${DIR_WORK}/ISTAT
URL_ISTAT_DATA="http://www.istat.it/storage/cartografia/confini_amministrativi/non_generalizzati/Limiti01012020.zip"
FILE_ISTAT_ZIP=$( basename ${URL_ISTAT_DATA} )
DIR_ISTAT_DATA=$( echo ${FILE_ISTAT_ZIP} | sed 's/\.zip//' )

# Create dir
if [[ -d ${DIR_ISTAT} ]]; then
	rm -fr ${DIR_ISTAT}
fi
mkdir ${DIR_ISTAT}
cd ${DIR_ISTAT}

# Download data
wget -O ${FILE_ISTAT_ZIP} "${URL_ISTAT_DATA}"

# Unzip file
unzip ${FILE_ISTAT_ZIP}
rm ${FILE_ISTAT_ZIP}
echo ""

# Convert Shapefile to GeoJSON
N_DIRS=$(ls -d ${DIR_ISTAT_DATA}/* | wc -l | awk '{print $1}')
COUNT=1
for DIR in $(ls -d ${DIR_ISTAT_DATA}/*); do
	FILE_SHAPE=$( basename ${DIR} )_WGS84.shp
	FILE_GEOJSON=$( basename ${DIR} )_WGS84.geojson
	echo " ${COUNT}/${N_DIRS} - Converting \"${FILE_SHAPE}\" to \"${FILE_GEOJSON}\":" 
	COMMAND="time docker run -it -v $(pwd)/${DIR}:/data geographica/gdal2:2.4.0 bash -c \"ogr2ogr -f GeoJSON -t_srs EPSG:4326 /data/${FILE_GEOJSON} /data/${FILE_SHAPE}\""
	echo "  ${COMMAND}"
	eval ${COMMAND}
	echo " Done"
	COUNT=$(( ${COUNT} + 1 ))
	echo ""
done
echo ""
