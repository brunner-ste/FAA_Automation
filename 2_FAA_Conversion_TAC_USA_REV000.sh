#!/bin/bash

# TAC USA

NAME='tac_usa'
GROUP='sec'
CATEGORY='aero'
PUBLISHED='2018-06'
AREA='usa'

RAW=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/final_tac_'$AREA''
ARCHIVE=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/tac_'$AREA'.tar.gz'
CONVERTED=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/tac_'$AREA''
PACK=''$HOME'/server/Eanserver18/raster/tmp/BR/automated_cycles/faa/tif/tac_'$AREA'/tac_'$AREA'.pck*'

clear

##################################
echo ' '
date
echo Gestartet um: > log_$NAME
date >> log_$NAME
##################################

mkdir $NAME

# Immer letzte Version verwenden!
CRUNCHER=''$HOME'/server/Eanserver18/raster/tmp/BR/'

cd $RAW
gdalbuildvrt $NAME.vrt -srcnodata 0 *.tif

echo ' '
date
echo 'Konvertierung gestartet...'
echo ' '
# Mapcruncher

$CRUNCHER/mapcruncher -n $NAME -g $GROUP -c $CATEGORY -p $PUBLISHED $NAME.vrt ../$NAME.pck && date && do_refurbish-raster-map ../$NAME.pck ../$NAME/$NAME.pck && extract-map.def-zl.def ../$NAME/$NAME.pck ../$NAME

rm ../$NAME.pck*

# Tar Archiv fuer EN5 erstellen
echo ' '
date
echo ' '
echo 'EN5 Archiv erstellen...'
pack2tar $PACK | gzip >$ARCHIVE

date
echo ' '
echo 'MD5 Summen erstellen...'
cd ..
cd $CONVERTED

md5sum *.pck* >$NAME.md5

cd ..
mkdir en7
mv $CONVERTED en7

date
echo ' '
echo 'Konvertierung und Ablage aller Daten abgeschlossen...'
echo ' '

##################################
echo ' ' >> log_$NAME
echo Fertig um: >> log_$NAME
date >> log_$NAME
##################################
			