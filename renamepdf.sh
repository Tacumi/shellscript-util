#!/bin/bash
#
if [ ! -x /usr/local/bin/pdfinfo ]
then
  echo "[error] This script is depends on pdfinfo which is part of xpdf"
  exit 1
fi
if [ ! -e *.pdf ]; then
  echo "[error] This script renames all PDF files in current direcory \
with it title of metadata"
  echo "[error] It's seems to be no PDF files."
  exit 1
elif [ ! -w *.pdf ]; then
  echo "[error] This script renames all PDF files in current direcory \
with it title of metadata"
  echo "[error] Permission Denied: Write Error"
  exit 1
fi
for i in *.pdf; do
  pdftitle=$(pdfinfo ${i} | grep Title | cut -d ':' -f 2 | xargs | tr ' ' '_' | tr '/' '_')
  pdftitle+=".pdf"
  mv ${i} ${pdftitle}
done
