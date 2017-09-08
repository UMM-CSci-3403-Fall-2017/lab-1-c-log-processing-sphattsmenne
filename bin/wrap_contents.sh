contentsFile=$1
header=$2_header.html
footer=$2_footer.html

cat $header $contentsFile $footer > $3
