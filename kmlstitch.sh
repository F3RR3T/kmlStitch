# Shell script to stitch kml files together.
# SJP August 2015

# name the data directory
datadir='../data/'
echo $datadir

outfile='alltrip.kml'
endheader='<name>'

# Functions ##########################

unzipKmz()
{
 echo file is $file   
 if [ ${file: -4} == ".kmz" ]
 then
    unzip $file
 fi
}


extractTrack()
{
    if [ -f doc.kml ]
    then    # look for instances of the 'placemark' tag in the file
        placelines=$( lineNums placemark doc.kml)
        startline=$(echo $placelines | cut -d ' ' -f 1 )
        endline=$(echo $placelines | rev | cut -d ' ' -f 1 | rev)
        echo $FUNCNAME
        # write the contents of the placemark tag to the output file
        sed -n "${startline},${endline}p" doc.kml >> ${outfile}
        echo $FUNCNAME: placelines: $placelines
        echo startline: $startline
        echo endline $endline
        rm doc.kml
    fi
}
#

writeHeader()
{
    if [ -f $outfile ]
    then
        mv $outfile $outfile.old
    fi
    
    #stopline=$(grep -n $endheader doc.kml | cut -d : -f 1 | head -1)
    stopline=$(lineNums $endheader doc.kml | head -1)
echo $FUNCNAME
    sed -e ${stopline}q doc.kml > $outfile
    echo stopline = $stopline
}

# return a list of line numbers that match arg1
lineNums()
{
    match=$1
    file=$2
    grep -ni ${match} ${file} | cut -d : -f 1 
}

# Add ending tags to kml file

endKml()
{
    echo "</Document>" >> ${outfile}
    echo "</kml>" >> ${outfile}
}

######################################

# loop through the kml directory

count=0     # loop counter

for file in "$datadir"*.km?
do
    count=$((count+1))
    echo $count ":"
    unzipKmz
    if [ $count == 1 ]
    then
        writeHeader
    fi
    extractTrack
done

endKml
zip ${outfile}.kmz ${outfile}
rm ${outfile}

echo "finished"	

#ls -f $datadir | while read -r file; do wc "$file"; done 
