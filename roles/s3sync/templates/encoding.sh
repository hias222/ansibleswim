#!/bin/bash
#Umlaute, Leerstellen und Bindestriche aus der angehängten Datei entfernen:
#set -x 

# Ü sed 's/\d194\d129/ü/g' steuer.test
# ä sed 's/\d226\d128\d158/ä/g' steuer.tes
#  echo Apple | perl -ne 'printf "%vd\n", $_'
# cat steuer.test | perl -ne 'printf "%vd\n", $_'

nampath=/opt/shared/nam

for filename in ${nampath}/steuer.txt; do
    echo $filename
    sed -i -e 's/\d194\d129/ü/g' \
        -i -e 's/\d226\d128\d158/ä/g' \
    $filename
done

for filename in ${nampath}/*.nam; do
    echo $filename
    sed -i -e 's/\d194\d129/ü/g' \
        -i -e 's/\d226\d128\d158/ä/g' \
    $filename
done