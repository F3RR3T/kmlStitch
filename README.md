# kmlstitch
A Linux bash shell script that concatenates a set of kml (or kmz) route files into a single file.

Synonyms for concatenate: stitch combine aggregate add together 

## Instructions

- Save the script somewhere and make it executable.
  - See: http://www.howtogeek.com/67469/the-beginners-guide-to-shell-scripting-the-basics/
- Put the kml or kmz files in a directory called data.
- In a terminal, navigate to the directory ABOVE /data.
- Run the script.
  - _i.e._ type <pre>kmlstitch</pre>

The results is a zipped file called 'alltracks'.
- Raw data files are not harmed but files called 'doc.kml' in the data directory will be deleted.
- Edit the script to change the source data directory.

### Future features
- manage embedded pictures
- 

