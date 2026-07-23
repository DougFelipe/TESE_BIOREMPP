#!/bin/sh
set -eu

MAIN_TEX="${1:-TESE.tex}"
BASE_NAME="${MAIN_TEX%.tex}"

pdflatex -interaction=nonstopmode -file-line-error "${MAIN_TEX}"
makeglossaries "${BASE_NAME}"
bibtex "${BASE_NAME}"
pdflatex -interaction=nonstopmode -file-line-error "${MAIN_TEX}"
pdflatex -interaction=nonstopmode -file-line-error "${MAIN_TEX}"
