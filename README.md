# ISTAT-Shapefile-to-GeoJSON
Converte gli Shapefile del *2020* della *versione non generalizzata (piu' dettagliata)* presenti sul sito dell'ISTAT:
- https://www.istat.it/it/archivio/222527

in GeoJSON.

## Download e run
```
$ git clone https://github.com/vlauciani/ISTAT-Shapefile-to-GeoJSON.git
$ cd ISTAT-Shapefile-to-GeoJSON
$
$ ./script.sh
--2020-05-14 00:01:24--  http://www.istat.it/storage/cartografia/confini_amministrativi/non_generalizzati/Limiti01012020.zip
Resolving www.istat.it (www.istat.it)... 193.204.90.6
Connecting to www.istat.it (www.istat.it)|193.204.90.6|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://www.istat.it/storage/cartografia/confini_amministrativi/non_generalizzati/Limiti01012020.zip [following]
--2020-05-14 00:01:24--  https://www.istat.it/storage/cartografia/confini_amministrativi/non_generalizzati/Limiti01012020.zip
Connecting to www.istat.it (www.istat.it)|193.204.90.6|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 64976489 (62M) [application/zip]
Saving to: ‘Limiti01012020.zip’

Limiti01012020.zip                                                                         100%[======================================================================================================================================================================================================================================>]  61.97M  8.67MB/s    in 7.2s

2020-05-14 00:01:31 (8.63 MB/s) - ‘Limiti01012020.zip’ saved [64976489/64976489]

Archive:  Limiti01012020.zip
   creating: Limiti01012020/
   creating: Limiti01012020/Com01012020/
  inflating: Limiti01012020/Com01012020/Com01012020_WGS84.dbf
  inflating: Limiti01012020/Com01012020/Com01012020_WGS84.prj
  inflating: Limiti01012020/Com01012020/Com01012020_WGS84.shp
  inflating: Limiti01012020/Com01012020/Com01012020_WGS84.shx
   creating: Limiti01012020/ProvCM01012020/
  inflating: Limiti01012020/ProvCM01012020/ProvCM01012020_WGS84.dbf
  inflating: Limiti01012020/ProvCM01012020/ProvCM01012020_WGS84.prj
  inflating: Limiti01012020/ProvCM01012020/ProvCM01012020_WGS84.shp
  inflating: Limiti01012020/ProvCM01012020/ProvCM01012020_WGS84.shx
   creating: Limiti01012020/Reg01012020/
  inflating: Limiti01012020/Reg01012020/Reg01012020_WGS84.dbf
  inflating: Limiti01012020/Reg01012020/Reg01012020_WGS84.prj
  inflating: Limiti01012020/Reg01012020/Reg01012020_WGS84.shp
  inflating: Limiti01012020/Reg01012020/Reg01012020_WGS84.shx
   creating: Limiti01012020/RipGeo01012020/
  inflating: Limiti01012020/RipGeo01012020/RipGeo01012020_WGS84.dbf
  inflating: Limiti01012020/RipGeo01012020/RipGeo01012020_WGS84.prj
  inflating: Limiti01012020/RipGeo01012020/RipGeo01012020_WGS84.shp
  inflating: Limiti01012020/RipGeo01012020/RipGeo01012020_WGS84.shx

 1/4 - Converting "Com01012020_WGS84.shp" to "Com01012020_WGS84.geojson":
  time docker run -it -v $(pwd)/ISTAT-Shapefile-to-GeoJSON/ISTAT/Limiti01012020/Com01012020:/data geographica/gdal2:2.4.0 bash -c "ogr2ogr -f GeoJSON -t_srs EPSG:4326 /data/Com01012020_WGS84.geojson /data/Com01012020_WGS84.shp"

real	0m40.103s
user	0m0.045s
sys	0m0.108s
 Done

 2/4 - Converting "ProvCM01012020_WGS84.shp" to "ProvCM01012020_WGS84.geojson":
  time docker run -it -v $(pwd)/ISTAT-Shapefile-to-GeoJSON/ISTAT/Limiti01012020/ProvCM01012020:/data geographica/gdal2:2.4.0 bash -c "ogr2ogr -f GeoJSON -t_srs EPSG:4326 /data/ProvCM01012020_WGS84.geojson /data/ProvCM01012020_WGS84.shp"

real	0m7.105s
user	0m0.038s
sys	0m0.020s
 Done

 3/4 - Converting "Reg01012020_WGS84.shp" to "Reg01012020_WGS84.geojson":
  time docker run -it -v $(pwd)/ISTAT-Shapefile-to-GeoJSON/ISTAT/Limiti01012020/Reg01012020:/data geographica/gdal2:2.4.0 bash -c "ogr2ogr -f GeoJSON -t_srs EPSG:4326 /data/Reg01012020_WGS84.geojson /data/Reg01012020_WGS84.shp"

real	0m4.730s
user	0m0.038s
sys	0m0.023s
 Done

 4/4 - Converting "RipGeo01012020_WGS84.shp" to "RipGeo01012020_WGS84.geojson":
  time docker run -it -v $(pwd)/ISTAT-Shapefile-to-GeoJSON/ISTAT/Limiti01012020/RipGeo01012020:/data geographica/gdal2:2.4.0 bash -c "ogr2ogr -f GeoJSON -t_srs EPSG:4326 /data/RipGeo01012020_WGS84.geojson /data/RipGeo01012020_WGS84.shp"

real	0m4.025s
user	0m0.034s
sys	0m0.018s
 Done

$
$ ls -l ISTAT/Limiti01012020/*/*.geojson
 ISTAT/Limiti01012020/Com01012020/Com01012020_WGS84.geojson
 ISTAT/Limiti01012020/ProvCM01012020/ProvCM01012020_WGS84.geojson
 ISTAT/Limiti01012020/Reg01012020/Reg01012020_WGS84.geojson
 ISTAT/Limiti01012020/RipGeo01012020/RipGeo01012020_WGS84.geojson
$
$
```
