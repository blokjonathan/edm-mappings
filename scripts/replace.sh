#!/bin/sh

sed 's/Netherlands Institute for Sound and Vision/Universitaire Bibliotheken Leiden/' $1 > $1.temp_1
sed 's/EUscreen/Digitale Collectie/' $1.temp_1 > $1.temp_2
sed 's/\&amp;amp;/\&amp;/' $1.temp_2 > $1.temp_3
rm $1.temp_1
rm $1.temp_2
mv $1.temp_3 $1
