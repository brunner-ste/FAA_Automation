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
#  	Automated Creation of Sectional Charts for the USA
# 
#	Einzelaufruf mit ./Name_of_Script 2>log_sec.txt (-> Trennt log der Donwloads und Fehler)		

clear

NAME=Sectional_Charts_USA

# Directories
WORK=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif'
RAW=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/raw_sec'
SHP=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/shp/sec'
DOWNLOAD=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/aeronav.faa.gov/content/aeronav/sectional_files'

##################################
echo ' '
date
echo Gestartet um: > time_log_$NAME
date >> time_log_$NAME
##################################

# Download der neuesten Sectional Charts

echo Downloading ...
echo See error_sec.log for details
echo ' '

wget -r -nc -l1 --no-parent -A.zip http://aeronav.faa.gov/content/aeronav/sectional_files/

########################################
echo ' ' >> time_log_$NAME
echo Download fertig um: >> time_log_$NAME
date >> time_log_$NAME
########################################

# read -p "Press [ENTER] to continue or abort with [CTRL]+[C]"

# Entpacken der neuesten Edition in den RAW Ordner

rm -r convert_sec_*

mkdir convert_sec_conus
mkdir convert_sec_ak
mkdir convert_sec_as
mkdir convert_sec_hi
mkdir convert_sec_mp

mkdir raw_sec

cd $DOWNLOAD

current=$(ls -t $DOWNLOAD/Albuquerque* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Anchorage* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Atlanta* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Bethel* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Billings* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Brownsville* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Cape_Lisburne* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Charlotte* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Cheyenne* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Chicago* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Cincinnati* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Cold_Bay* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Dallas-Ft_Worth* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Dawson* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Denver* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Detroit* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Dutch_Harbor* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/El_Paso* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Fairbanks* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Great_Falls* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Green_Bay* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Halifax* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Hawaiian_Islands* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Houston* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Jacksonville* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Juneau* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Kansas_City* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Ketchikan* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Klamath_Falls* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Kodiak* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Lake_Huron* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Las_Vegas* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Los_Angeles* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/McGrath* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Memphis* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Miami* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Montreal* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/New_Orleans* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/New_York* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Nome* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Omaha* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Phoenix* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Point_Barrow* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Salt_Lake_City* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/San_Antonio* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/San_Francisco* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Seattle* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Seward* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/St_Louis* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Twin_Cities* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Washington* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Western_Aleutian_Islands* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Whitehorse* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Wichita* | head -1)
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

#############
### CONUS ###
#############

#Albuquerque
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Albuquerque_SEC_*.tif Albuquerque_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -109.00 36.10 -102.00 32.00 Albuquerque_4326.tif ../convert_sec_conus/Albuquerque_final.tif
echo ' '
#Atlanta
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Atlanta_SEC_*.tif Atlanta_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -88.00 36.10 -81.00 32.00 Atlanta_4326.tif ../convert_sec_conus/Atlanta_final.tif
echo ' '
#Billings
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Billings_SEC_*.tif Billings_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -109.00 49.00 -101.00 44.50 Billings_4326.tif ../convert_sec_conus/Billings_final.tif
echo ' '
#Brownsville
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Brownsville_SEC_*.tif Brownsville_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -103.00 28.10 -97.00 24.00 Brownsville_4326.tif ../convert_sec_conus/Brownsville_final.tif
echo ' '
#Charlotte
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Charlotte_SEC_*.tif Charlotte_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -82.00 36.10 -75.50 32.00 Charlotte_4326.tif ../convert_sec_conus/Charlotte_final.tif
echo ' '
#Cheyenne
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Cheyenne_SEC_*.tif Cheyenne_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -109.00 44.50 -101.00 40.00 Cheyenne_4326.tif ../convert_sec_conus/Cheyenne_final.tif
echo ' '
#Chicago
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Chicago_SEC_*.tif Chicago_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -93.00 44.10 -85.00 40.00 Chicago_4326.tif ../convert_sec_conus/Chicago_final.tif
echo ' '
#Cincinnati
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Cincinnati_SEC_*.tif Cincinnati_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -85.00 40.10 -78.00 36.00 Cincinnati_4326.tif ../convert_sec_conus/Cincinnati_final.tif
echo ' '
#Dallas Ft. Worth
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Dallas-Ft_Worth_SEC_*.tif Dallas-Ft_Worth_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -102.00 36.10 -95.00 32.00 Dallas-Ft_Worth_4326.tif ../convert_sec_conus/Dallas-Ft_Worth_final.tif
echo ' '
#Denver
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Denver_SEC_*.tif Denver_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -111.00 40.05 -104.00 35.65 Denver_4326.tif ../convert_sec_conus/Denver_final.tif
echo ' '
#Detroit
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Detroit_SEC_*.tif Detroit_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -85.00 44.10 -77.00 40.00 Detroit_4326.tif ../convert_sec_conus/Detroit_final.tif
echo ' '
#El Paso
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 El_Paso_SEC_*.tif El_Paso_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -109.00 32.10 -103.00 28.00 El_Paso_4326.tif ../convert_sec_conus/El_Paso_final.tif
echo ' '
#Great Falls
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Great_Falls_SEC_*.tif Great_Falls_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -117.00 49.00 -109.00 44.50 Great_Falls_4326.tif ../convert_sec_conus/Great_Falls_final.tif
echo ' '
#Green Bay
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Green_Bay_SEC_*.tif Green_Bay_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -93.00 48.10 -84.80 44.00 Green_Bay_4326.tif ../convert_sec_conus/Green_Bay_final.tif
echo ' '
#Halifax
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Halifax_SEC_*.tif Halifax_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -69.00 48.10 -61.00 44.00 Halifax_4326.tif ../convert_sec_conus/Halifax_final.tif
echo ' '
#Houston
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Houston_SEC_*.tif Houston_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -97.00 32.10 -90.75 28.00 Houston_4326.tif ../convert_sec_conus/Houston_final.tif
echo ' '
#Jacksonville
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Jacksonville_SEC_*.tif Jacksonville_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -85.00 32.10 -78.75 28.00 Jacksonville_4326.tif ../convert_sec_conus/Jacksonville_final.tif
echo ' '
#Kansas City
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Kansas_City_SEC_*.tif Kansas_City_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -97.00 40.10 -90.00 36.00 Kansas_City_4326.tif ../convert_sec_conus/Kansas_City_final.tif
echo ' '
#Klamath Falls
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Klamath_Falls_SEC_*.tif Klamath_Falls_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -125.00 44.50 -117.00 40.00 Klamath_Falls_4326.tif ../convert_sec_conus/Klamath_Falls_final.tif
echo ' '
#Lake Huron
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Lake_Huron_SEC_*.tif Lake_Huron_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -85.00 48.10 -76.75 44.00 Lake_Huron_4326.tif ../convert_sec_conus/Lake_Huron_final.tif
echo ' '
#Las Vegas
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Las_Vegas_SEC_*.tif Las_Vegas_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -118.00 40.10 -111.00 35.65 Las_Vegas_4326.tif ../convert_sec_conus/Las_Vegas_final.tif
echo ' '
#Los Angeles
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Los_Angeles_SEC.shp -dstalpha -t_srs EPSG:4326 Los_Angeles_SEC_*.tif ../convert_sec_conus/Los_Angeles_final.tif
### SHAPE CROPPING ###
echo ' '
#Memphis
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Memphis_SEC_*.tif Memphis_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -95.00 36.10 -88.00 32.00 Memphis_4326.tif ../convert_sec_conus/Memphis_final.tif
echo ' '
#Miami
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Miami_SEC_*.tif Miami_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -83.00 28.10 -76.50 24.00 Miami_4326.tif ../convert_sec_conus/Miami_final.tif
echo ' '
#Montreal
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Montreal_SEC_*.tif Montreal_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -77.00 48.10 -68.75 44.00 Montreal_4326.tif ../convert_sec_conus/Montreal_final.tif
echo ' '
#New Orleans
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 New_Orleans_SEC_*.tif New_Orleans_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -91.00 32.10 -84.75 28.00 New_Orleans_4326.tif ../convert_sec_conus/New_Orleans_final.tif
echo ' '
#New York
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 New_York_SEC_*.tif New_York_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -77.00 44.10 -69.00 40.00 New_York_4326.tif ../convert_sec_conus/New_York_final.tif
echo ' '
#Omaha
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Omaha_SEC_*.tif Omaha_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -101.00 44.50 -93.00 40.00 Omaha_4326.tif ../convert_sec_conus/Omaha_final.tif
echo ' '
#Phoenix
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Phoenix_SEC_*.tif Phoenix_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -116.00 35.65 -109.00 31.30 Phoenix_4326.tif ../convert_sec_conus/Phoenix_final.tif
echo ' '
#Salt Lake City
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Salt_Lake_City_SEC_*.tif Salt_Lake_City_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -117.00 44.50 -109.00 40.00 Salt_Lake_City_4326.tif ../convert_sec_conus/Salt_Lake_City_final.tif
echo ' '
#San Antonio
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 San_Antonio_SEC_*.tif San_Antonio_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -103.00 32.00 -96.50 28.00 San_Antonio_4326.tif ../convert_sec_conus/San_Antonio_final.tif
echo ' '
#San Francisco
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 San_Francisco_SEC_*.tif San_Francisco_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -125.00 40.10 -118.00 36.00 San_Francisco_4326.tif ../convert_sec_conus/San_Francisco_final.tif
echo ' '
#Seattle
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Seattle_SEC_*.tif Seattle_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -125.00 49.00 -116.75 44.50 Seattle_4326.tif ../convert_sec_conus/Seattle_final.tif
echo ' '
#St. Louis
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 St_Louis_SEC_*.tif St_Louis_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -91.00 40.10 -84.00 36.00 St_Louis_4326.tif ../convert_sec_conus/St_Louis_final.tif
echo ' '
#Twin Cities
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Twin_Cities_SEC_*.tif Twin_Cities_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -101.00 49.00 -93.00 44.50 Twin_Cities_4326.tif ../convert_sec_conus/Twin_Cities_final.tif
echo ' '
#Washington
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Washington_SEC_*.tif Washington_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -79.00 40.10 -72.00 36.00 Washington_4326.tif ../convert_sec_conus/Washington_final.tif
echo ' '
#Wichita
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Wichita_SEC_*.tif Wichita_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -104.00 40.10 -97.00 36.00 Wichita_4326.tif ../convert_sec_conus/Wichita_final.tif
echo ' '

##############
### ALASKA ###
##############

#Anchorage
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Anchorage_SEC_*.tif Anchorage_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -151.50 64.10 -140.50 60.00 Anchorage_4326.tif ../convert_sec_ak/Anchorage_final.tif
echo ' '
#Bethel
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Bethel_SEC_*.tif Bethel_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -173.00 64.10 -161.50 59.65 Bethel_4326.tif ../convert_sec_ak/Bethel_final.tif
echo ' '
#Cape Lisburne
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Cape_Lisburne_SEC_*.tif Cape_Lisburne_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -171.50 72.10 -156.75 68.00 Cape_Lisburne_4326.tif ../convert_sec_ak/Cape_Lisburne_final.tif
echo ' '
#Cold_Bay
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Cold_Bay_SEC_*.tif Cold_Bay_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -164.00 56.10 -154.40 53.90 Cold_Bay_4326.tif ../convert_sec_ak/Cold_Bay_final.tif
echo ' '
#Dawson
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Dawson_SEC_*.tif Dawson_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -145.00 68.10 -132.00 64.00 Dawson_4326.tif ../convert_sec_ak/Dawson_final.tif
echo ' '
#Dutch Harbor
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Dutch_Harbor_SEC.shp -dstalpha -t_srs EPSG:4326 Dutch_Harbor_SEC_*.tif ../convert_sec_ak/Dutch_Harbor_final.tif
### SHAPE CROPPING ###
echo ' '
#Fairbanks
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Fairbanks_SEC_*.tif Fairbanks_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -158.00 68.10 -145.00 64.00 Fairbanks_4326.tif ../convert_sec_ak/Fairbanks_final.tif
echo ' '
#Juneau
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Juneau_SEC.shp -dstalpha -t_srs EPSG:4326 Juneau_SEC_*.tif ../convert_sec_ak/Juneau_final.tif
### SHAPE CROPPING ###
echo ' '
#Ketchikan
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Ketchikan_SEC_*.tif Ketchikan_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -135.50 56.20 -129.80 52.00 Ketchikan_4326.tif ../convert_sec_ak/Ketchikan_final.tif
echo ' '
#Kodiak
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Kodiak_SEC.shp -dstalpha -t_srs EPSG:4326 Kodiak_SEC_*.tif ../convert_sec_ak/Kodiak_final.tif
### SHAPE CROPPING ###
echo ' '
#McGrath
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 McGrath_SEC_*.tif McGrath_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -162.00 64.10 -150.80 60.00 McGrath_4326.tif ../convert_sec_ak/McGrath_final.tif
echo ' '
#Nome
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Nome_SEC_*.tif Nome_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -171.50 68.10 -158.00 64.00 Nome_4326.tif ../convert_sec_ak/Nome_final.tif
echo ' '
#Point Barrow
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Point_Barrow_SEC_*.tif Point_Barrow_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -157.00 72.10 -141.00 68.00 Point_Barrow_4326.tif ../convert_sec_ak/Point_Barrow_final.tif
echo ' '
#Seward
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Seward_SEC_*.tif Seward_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -152.50 61.45 -140.50 59.20 Seward_4326.tif ../convert_sec_ak/Seward_final.tif
echo ' '
#Whitehorse
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Whitehorse_SEC_*.tif Whitehorse_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin -141.00 64.10 -129.90 60.00 Whitehorse_4326.tif ../convert_sec_ak/Whitehorse_final.tif
echo ' '

###############
### ALEUTEN ###		Islands West und Part 2 werden für die Konvertierung zu MP (Guam) kopiert, besser für die Konvertierung da geringere Longitude Ausdehnung 
###############

#Western Aleutian Islands West
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Western_Aleutian_Islands_West_SEC_*.tif Western_Aleutian_Islands_West_4326.tif
gdal_translate -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -expand rgba -projwin 169.50 53.10 178.30 51.00 Western_Aleutian_Islands_West_4326.tif ../convert_sec_mp/Western_Aleutian_Islands_West_final.tif
echo ' '
#Western Aleutian Islands East Part 1(Datumsgrenze!)
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Western_Aleutian_Islands_East_Part1_SEC.shp -crop_to_cutline -dstalpha Western_Aleutian_Islands_East_SEC_*.tif Western_Aleutian_Islands_East_Part1_crop.tif
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Western_Aleutian_Islands_East_Part1_crop.tif ../convert_sec_ak/Western_Aleutian_Islands_East_Part1_final.tif
echo ' '
#Western Aleutian Islands East Part 2(Datumsgrenze!)
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Western_Aleutian_Islands_East_Part2_SEC.shp -crop_to_cutline -dstalpha Western_Aleutian_Islands_East_SEC_*.tif Western_Aleutian_Islands_East_Part2_crop.tif
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -t_srs EPSG:4326 Western_Aleutian_Islands_East_Part2_crop.tif ../convert_sec_mp/Western_Aleutian_Islands_East_Part2_final.tif
echo ' '

##############
### HAWAII ###
##############

#Hawaiian Islands
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Hawaiian_Islands_SEC.shp -dstalpha -t_srs EPSG:4326 Hawaiian_Islands_SEC*.tif ../convert_sec_hi/Hawaiian_Islands_final.tif
### SHAPE CROPPING ###
echo ' '
#Honululu Inset
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Honululu_Inset_SEC.shp -dstalpha -t_srs EPSG:4326 Honolulu_Inset_SEC*.tif ../convert_sec_hi/Honululu_Inset_final.tif
### SHAPE CROPPING ###
echo ' '

############
### GUAM ###
############

#Mariana Islands Inset --> Guam
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Mariana_Islands_Inset_SEC.shp -dstalpha -t_srs EPSG:4326 Mariana_Islands_Inset_SEC*.tif ../convert_sec_mp/Mariana_Islands_Inset_final.tif
### SHAPE CROPPING ###
echo ' '

#############
### SAMOA ###
#############

#American Samoa (Datumsgrenze!)
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Samoan_Islands_Inset_SEC.shp -dstalpha -t_srs EPSG:4326 Samoan_Islands_Inset_SEC*.tif ../convert_sec_as/Samoan_Islands_Inset_final.tif
### SHAPE CROPPING ###
echo ' '

echo "Sectional charts: done"
echo ' '

# Aufräumen
rm -r $RAW


cd ../convert_sec_conus
count_sec_conus=$(ls | wc -l)

cd ../convert_sec_ak
count_sec_ak=$(ls | wc -l)

cd ../convert_sec_hi
count_sec_hi=$(ls | wc -l)

cd ../convert_sec_mp
count_sec_mp=$(ls | wc -l)

cd ../convert_sec_as
count_sec_as=$(ls | wc -l)

cd ..

###################################################
echo ' ' >> time_log_$NAME
echo Prozessierung fertig um: >> time_log_$NAME
date >> time_log_$NAME
echo ' ' >> time_log_$NAME
echo $count_sec_conus Files processed >> time_log_$NAME
echo 37 CONUS Files expected >> time_log_$NAME
echo ' ' >> time_log_$NAME
echo $count_sec_ak Files processed >> time_log_$NAME
echo 16 AK Files expected >> time_log_$NAME
echo ' ' >> time_log_$NAME
echo $count_sec_hi Files processed >> time_log_$NAME
echo 2 HI Files expected >> time_log_$NAME
echo ' ' >> time_log_$NAME
echo $count_sec_mp Files processed >> time_log_$NAME
echo 3 MP Files expected >> time_log_$NAME
echo ' ' >> time_log_$NAME
echo $count_sec_as Files processed >> time_log_$NAME
echo 1 AS Files expected >> time_log_$NAME
###################################################

date
echo ' '
