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
#  	Automated Creation of Helicopter Charts for the USA
# 
#	Einzelaufruf mit ./Name_of_Script 2>error_heli.log (-> Trennt log der Donwloads und Fehler)		

clear

NAME=Helicopter_Charts_USA

# Directories
WORK=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif'
RAW=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/raw_heli'
SHP=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/shp/heli'
DOWNLOAD=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/aeronav.faa.gov/content/aeronav/heli_files'

##################################
echo ' '
date
echo Gestartet um: > time_log_$NAME
date >> time_log_$NAME
##################################

# Download der neuesten Helicopter Charts

echo Downloading ...
echo See error_heli.log for details
echo ' '
wget -r -nc -l1 --no-parent -A.zip http://aeronav.faa.gov/content/aeronav/heli_files/

########################################
echo ' ' >> time_log_$NAME
echo Download fertig um: >> time_log_$NAME
date >> time_log_$NAME
########################################

# read -p "Press [ENTER] to continue or abort with [CTRL]+[C]"

# Entpacken der neuesten Edition in den RAW Ordner

rm -r convert_heli_*

mkdir convert_heli_usa

mkdir raw_heli

cd $DOWNLOAD

current=$(ls -t $DOWNLOAD/Balt_Wash_Heli* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Boston_Heli* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Chicago_Heli* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Dallas-Ft_Worth_Heli* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Detroit_Heli* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Houston_Heli* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/Los_Angeles_Heli* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/New_York_Heli* | head -1)
echo $current
unzip -o "$current" -d $RAW

current=$(ls -t $DOWNLOAD/US_Gulf_Coast_Heli* | head -1)
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
rename 's/U.S./US/g' *
rename "s/\'/_/" *

# Start der Prozessierung, umprojizieren und croppen der Karten

################
### HELI USA ###	--> werden alle mit Shape File gecroppt
################

#Baltimore
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Baltimore_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Baltimore_HEL*.tif ../convert_heli_usa/Baltimore_final.tif
echo ' '
#Washington
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Washington_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Washington_HEL*.tif ../convert_heli_usa/Washington_final.tif
echo ' '
#Washington Inset
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Washington_Inset_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Washington_Inset_HEL*.tif ../convert_heli_usa/Washington_Inset_final.tif
echo ' '
#Boston Downtown
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Boston_Downtown_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Boston_Downtown_HEL*.tif ../convert_heli_usa/Boston_Downtown_final.tif
echo ' '
#Boston
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Boston_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Boston_HEL*.tif ../convert_heli_usa/Boston_final.tif
echo ' '
#Chicago
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Chicago_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Chicago_HEL*.tif ../convert_heli_usa/Chicago_final.tif
echo ' '
#Chicago O`Hare
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Chicago_O_Hare_Inset.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Chicago_O_Hare_Inset_HEL*.tif ../convert_heli_usa/Chicago_O_Hare_Inset_final.tif
echo ' '
#Dallas-Ft Worth
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Dallas-Ft_Worth_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Dallas-Ft_Worth_HEL*.tif ../convert_heli_usa/Dallas-Ft_Worth_final.tif
echo ' '
#Dallas-Love Inset
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Dallas-Love_Inset_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Dallas-Love_Inset_HEL*.tif ../convert_heli_usa/Dallas-Love_Inset_final.tif
echo ' '
#Detroit
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Detroit_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Detroit_HEL*.tif ../convert_heli_usa/Detroit_final.tif
echo ' '
#Houston North
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Houston_North_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Houston_North_HEL*.tif ../convert_heli_usa/Houston_North_final.tif
echo ' '
#Houston South
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Houston_South_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Houston_South_HEL*.tif ../convert_heli_usa/Houston_South_final.tif
echo ' '
#Los Angeles East
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Los_Angeles_East_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Los_Angeles_East*.tif ../convert_heli_usa/Los_Angeles_East_final.tif
echo ' '
#Los Angeles West
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Los_Angeles_West_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Los_Angeles_West*.tif ../convert_heli_usa/Los_Angeles_West_final.tif
echo ' '
#Downtown Manhattan
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Downtown_Manhattan_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Downtown_Manhattan*.tif ../convert_heli_usa/Downtown_Manhattan_final.tif
echo ' '
#Eastern Long Island
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/Eastern_Long_Island_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 Eastern_Long_Island*.tif ../convert_heli_usa/Eastern_Long_Island_final.tif
echo ' '
#New York
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/New_York_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 New_York*.tif ../convert_heli_usa/New_York_final.tif
echo ' '
#U.S. Gulf Coast
gdalwarp -of Gtiff -co COMPRESS=LZW -co PREDICTOR=2 -cutline $SHP/US_Gulf_Coast_HEL.shp -crop_to_cutline -dstalpha -t_srs EPSG:4326 US_Gulf_Coast_HEL*.tif ../convert_heli_usa/US_Gulf_Coast_final.tif
echo ' '


echo "Helicopter charts: done"
echo ' '

# read -p "Press [ENTER] to continue or abort with [CTRL]+[C]"

# Aufräumen

rm -r $RAW

cd ../convert_heli_usa

count_heli=$(ls | wc -l)

cd ..

###################################################
echo ' ' >> time_log_$NAME
echo Prozessierung fertig um: >> time_log_$NAME
date >> time_log_$NAME
echo ' ' >> time_log_$NAME
echo $count_heli Files processed >> time_log_$NAME
echo 18 Heli Files expected >> time_log_$NAME
###################################################

date
echo ' '

			#####################################
			#####################################
			## Ab hier Konvertierung der Daten ##
			#####################################
			#####################################