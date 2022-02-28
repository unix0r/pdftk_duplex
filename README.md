# pdftk_duplex
Turn a single page network scanner into a duplex scanner.

You want to turn your single page network scanner into a duplex page network scanner.
This docker container is the right thing for you!

Start the container with a mapped source and destination volume:
The source volume will hold the single page PDF files.
The single page PDFs will be shuffled together with reversed alternated order and the output is saved into the destination folder.

docker pull unix652/pdftk_duplex
docker run -v "/sourcefolder":"/src" -v "/destinationfolder":"/dst" unix652/pdftk_duplex

Create a profile for your network scanner to scan into the source folder.
First scan the uneven pages from the beginning. After that the even pages from the end.
You just have to turn around the pages and scan them starting from the last page.

The two PDFs should be in the source folder, will be recognized by a bash script and transformed into a single PDF.