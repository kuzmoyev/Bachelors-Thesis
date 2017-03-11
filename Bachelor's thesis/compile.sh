#!/usr/bin/env bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

TEX_FILE_NAME=$(echo *.tex)
PDF_FILE_NAME=pdf/${TEX_FILE_NAME/tex/pdf}
LOG_FILE_NAME=pdf/compilation.log

pdflatex -halt-on-error -file-line-error -interaction=nonstopmode -output-directory=pdf \
    ${TEX_FILE_NAME} > ${LOG_FILE_NAME}

if [ $? -eq 0 ]; then
    echo -e "${GREEN}"
    echo -n "Successfully Compiled ${PDF_FILE_NAME}"
    xdg-open ${PDF_FILE_NAME}
else
    sed "s/^\.\/\(${TEX_FILE_NAME}:[0-9]*\):/\.(\1)/" ${LOG_FILE_NAME}
    # grep ${tex_filename} ${LOG_FILE_NAME} | sed "s/^\.\/\(${tex_filename}:[0-9]*\):/\.(\1)/"
    echo -e "${RED}"
    echo -n "Compilation Error ${TEX_FILE_NAME}"
fi
echo -e "${NC}"