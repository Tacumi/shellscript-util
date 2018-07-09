#!/bin/bash
#
if [ -x pdfinfo ]
then
  echo "This script is depends on pdfinfo which is part of xpdf"
fi
for i in *.pdf; do
  pdftitle=$(pdfinfo ${i} | grep Title | cut -d ':' -f 2 | xargs | tr ' ' '_' | tr '/' '_')
  pdftitle+=".pdf"
  mv ${i} ${pdftitle}
done
