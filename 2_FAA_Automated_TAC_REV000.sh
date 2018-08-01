#!/bin/sh
#
# +--------------------------------------------------------------------------+
# |                                                                          |
# | Copyright by:                                                            |
# |                                                                          |
# | EuroAvionics Navigationssysteme GmbH                                     |
# | Karlsruher Straße 91                                                     |
# | 75179 Pforzheim                                                          |
# |                                                                          |
# +--------------------------------------------------------------------------+
# |                                                                          |
# | Author: Stefan Brunner                                                   |
# |                                                                          |
# +--------------------------------------------------------------------------+
#
# 
#  	Automated Creation of Terminal Charts for the USA
# 
#	Einzelaufruf mit ./Name_of_Script 2>error_tac.log (-> Trennt log der Donwloads und Fehler)		

clear

NAME=Terminal_Charts_USA

# Directories
WORK=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif'
RAW=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/raw_tac'
SHP=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/shp/tac'
DOWNLOAD=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/aeronav.faa.gov/content/aeronav/tac_files'

##################################
echo ' '
date
echo Gestartet um: > time_log_$NAME
date >> time_log_$NAME
##################################

# Download der neuesten Terminal Charts

echo Downloading ...
echo See error_tac.log for details
echo ' '
wget -r -nc -l1 --no-parent -A.zip http://aeronav.faa.gov/content/aeronav/tac_files/

########################################
echo ' ' >> time_log_$NAME
echo Download fertig um: >> time_log_$NAME
date >> time_log_$NAME
########################################

# read -p "Press [ENTER] to continue or abort with [CTRL]+[C]"

# Entpacken der neuesten Edition in den RAW Ordner

rm -r convert_tac_*

mkdir convert_tac_usa

mkdir raw_tac

cd $DOWNLOAD

current=$(ls -t $DOWNLOAD/Anchorage-Fairbanks* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Atlanta* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Baltimore-Washington* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Boston* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Charlotte* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Chicago* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Cincinnati* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Cleveland* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Dallas-Ft_Worth* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Denver* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Detroit* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Houston* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Kansas_City* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Las_Vegas* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Los_Angeles* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Memphis* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Miami* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Minneapolis-St_Paul* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/New_Orleans* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/New_York* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Philadelphia* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Phoenix* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Pittsburgh* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Puerto_Rico-VI* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/St_Louis* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Salt_Lake_City* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/San_Diego* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/San_Francisco* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Seattle* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Tampa-Orlando* | head -1)
echo $current
unzip -o "$current" -d $RAW


			#####################################
			#####################################
			## Ab hier Prozessierung der Daten ##
			#####################################
			#####################################


# Entfernen der Leerzeichen im Dateinamen 

echo ' '
echo ' '

cd $RAW
rename 's/\s/_/g' *

# Start der Prozessierung, umprojizieren und croppen der Karten

###############
### TAC USA ###
###############

#Anchorage
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Anchorage_TAC_*.tif Anchorage_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -151.75 61.60 -148.40 60.60 Anchorage_4326.tif ../convert_tac_usa/Anchorage_final.tif
echo ' '
#Fairbanks
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Fairbanks_TAC_*.tif Fairbanks_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -149.30 65.25 -145.80 64.20 Fairbanks_4326.tif ../convert_tac_usa/Fairbanks_final.tif
echo ' '
#Atlanta
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Atlanta_TAC_*.tif Atlanta_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -85.30 34.18 -83.65 33.00 Atlanta_4326.tif ../convert_tac_usa/Atlanta_final.tif
echo ' '
#Baltimore-Washington
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Baltimore-Washington_TAC_*.tif Baltimore-Washington_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -78.30 39.45 -75.80 38.20 Baltimore-Washington_4326.tif ../convert_tac_usa/Baltimore-Washington_final.tif
echo ' '
#Boston
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Boston_TAC_*.tif Boston_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -71.85 42.85 -69.60 41.25 Boston_4326.tif ../convert_tac_usa/Boston_final.tif
echo ' '
#Charlotte
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Charlotte_TAC_*.tif Charlotte_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -81.80 35.85 -80.15 34.60 Charlotte_4326.tif ../convert_tac_usa/Charlotte_final.tif
echo ' '
#Chicago
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Chicago_TAC_*.tif Chicago_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -88.75 42.45 -87.30	41.50 Chicago_4326.tif ../convert_tac_usa/Chicago_final.tif
echo ' '
#Cincinnati
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Cincinnati_TAC_*.tif Cincinnati_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -85.50 40.05 -83.75	38.50 Cincinnati_4326.tif ../convert_tac_usa/Cincinnati_final.tif
echo ' '
#Cleveland
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Cleveland_TAC_*.tif Cleveland_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -82.55 41.85 -81.10 40.90 Cleveland_4326.tif ../convert_tac_usa/Cleveland_final.tif
echo ' '
#Dallas Ft. Worth
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Dallas-Ft_Worth_TAC_*.tif Dallas-Ft_Worth_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -98.20 33.65 -95.95	32.05 Dallas-Ft_Worth_4326.tif ../convert_tac_usa/Dallas-Ft_Worth_final.tif
echo ' '
#Colorado Springs
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Colorado_Springs_TAC_*.tif Colorado_Springs_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -105.50	39.25 -103.50 37.85 Colorado_Springs_4326.tif ../convert_tac_usa/Colorado_Springs_final.tif
echo ' '
#Denver
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Denver_TAC_*.tif Denver_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -105.55	40.55 -103.75 39.25 Denver_4326.tif ../convert_tac_usa/Denver_final.tif
echo ' '
#Detroit
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Detroit_TAC_*.tif Detroit_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -84.25 42.85 -82.45	41.65 Detroit_4326.tif ../convert_tac_usa/Detroit_final.tif
echo ' '
#Houston
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Houston_TAC_*.tif Houston_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -96.10 30.50 -94.60	29.10 Houston_4326.tif ../convert_tac_usa/Houston_final.tif
echo ' '
#Kansas City
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Kansas_City_TAC_*.tif Kansas_City_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -95.85 39.95 -94.10	38.75 Kansas_City_4326.tif ../convert_tac_usa/Kansas_City_final.tif
echo ' '
#Las Vegas
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Las_Vegas_TAC_*.tif Las_Vegas_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -115.60 36.70 -113.90 35.75 Las_Vegas_4326.tif ../convert_tac_usa/Las_Vegas_final.tif
echo ' '
#Los Angeles
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Los_Angeles_TAC_*.tif Los_Angeles_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -119.10	34.50 -116.85 33.50 Los_Angeles_4326.tif ../convert_tac_usa/Los_Angeles_final.tif
echo ' '
#Memphis
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Memphis_TAC_*.tif Memphis_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -90.80 35.70 -89.20	34.45 Memphis_4326.tif ../convert_tac_usa/Memphis_final.tif
echo ' '
#Miami
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Miami_TAC.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Miami_TAC_*.tif ../convert_tac_usa/Miami_final.tif
### SHAPE CROPPING ###
echo ' '
#Minneapolis
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Minneapolis-St_Paul_TAC_*.tif Minneapolis-St_Paul_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -94.00 45.35 -92.50	44.40 Minneapolis-St_Paul_4326.tif ../convert_tac_usa/Minneapolis-St_Paul_final.tif
echo ' '
#New Orleans
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 New_Orleans_TAC_*.tif New_Orleans_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -91.25 30.55 -89.70	29.70 New_Orleans_4326.tif ../convert_tac_usa/New_Orleans_final.tif
echo ' '
#New York -- Achtung VFR Blatt muss vorher gelöscht werden
rm -r New_York_TAC_VFR* 
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 New_York_TAC_*.tif New_York_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -74.85 41.25 -72.70	40.25 New_York_4326.tif ../convert_tac_usa/New_York_final.tif
echo ' '
#Philadelphia
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Philadelphia_TAC_*.tif Philadelphia_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -75.90 40.50 -74.55	39.40 Philadelphia_4326.tif ../convert_tac_usa/Philadelphia_final.tif
echo ' '
#Phoenix
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Phoenix_TAC_*.tif Phoenix_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -112.80	34.05 -111.25 32.80 Phoenix_4326.tif ../convert_tac_usa/Phoenix_final.tif
echo ' '
#Pittsburgh
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Pittsburgh_TAC_*.tif Pittsburgh_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -80.90 41.00 -79.50	40.00 Pittsburgh_4326.tif ../convert_tac_usa/Pittsburgh_final.tif
echo ' '
#Puerto Rico, Virgin Islands
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Puerto_Rico-VI_TAC_*.tif Puerto_Rico-VI_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -67.30 18.75 -64.25 17.70 Puerto_Rico-VI_4326.tif ../convert_tac_usa/Puerto_Rico-VI_final.tif
echo ' '
#Salt Lake City
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Salt_Lake_City_TAC_*.tif Salt_Lake_City_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -112.85	41.40 -111.10 40.15 Salt_Lake_City_4326.tif ../convert_tac_usa/Salt_Lake_City_final.tif
echo ' '
#San Diego
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 San_Diego_TAC_*.tif San_Diego_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -117.95	33.60 -116.35 32.50 San_Diego_4326.tif ../convert_tac_usa/San_Diego_final.tif
echo ' '
#San Francisco
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 San_Francisco_TAC_*.tif San_Francisco_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -123.10	38.15 -121.45 37.05 San_Francisco_4326.tif ../convert_tac_usa/San_Francisco_final.tif
echo ' '
#Seattle
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Seattle_TAC_*.tif Seattle_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -123.15	48.05 -121.60 46.75 Seattle_4326.tif ../convert_tac_usa/Seattle_final.tif
echo ' '
#St. Louis
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 St_Louis_TAC_*.tif St_Louis_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -91.00 39.20 -89.65	38.25 St_Louis_4326.tif ../convert_tac_usa/St_Louis_final.tif
echo ' '
#Orlando
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Orlando_TAC_*.tif Orlando_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -82.00 29.15 -80.25	27.85 Orlando_4326.tif ../convert_tac_usa/Orlando_final.tif
echo ' '
#Tampa
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Tampa_TAC_*.tif Tampa_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -83.05 28.55 -81.90	27.35 Tampa_4326.tif ../convert_tac_usa/Tampa_final.tif
echo ' '

echo "Terminal charts: done"
echo ' '

# read -p "Press [ENTER] to continue or abort with [CTRL]+[C]"

# Aufräumen

rm -r $RAW

cd ../convert_tac_usa

count_tac=$(ls | wc -l)

cd ..

###################################################
echo ' ' >> time_log_$NAME
echo Prozessierung fertig um: >> time_log_$NAME
date >> time_log_$NAME
echo ' ' >> time_log_$NAME
echo $count_tac Files processed >> time_log_$NAME
echo 33 TAC Files expected >> time_log_$NAME
###################################################

date
echo ' '

			#####################################
			#####################################
			## Ab hier Konvertierung der Daten ##
			#####################################
			#####################################