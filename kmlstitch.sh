# Shell script to stitch kml files together.
# SJP August 2015

# name the data directory
datadir='../data/'
echo $datadir

# Functions ##########################

readKml()
{
	echo $file
}

######################################


for file in '$datadir'*
do
	echo  'file is $file\n'
done

echo "finished"	

ls -f $datadir | while read -r file; do wc "$file"; done 
