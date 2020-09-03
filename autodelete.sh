#!/bin/sh
find . -type d -name Library -prune -o -type f -name '*.aux' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.dvi' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.fdb_latexmk' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.fls' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.synctex.gz' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.log' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.synctex' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.toc' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.nav' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.snm' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.out' -exec rm -r {} \;
find . -type d -name Library -prune -o -type f -name '*.vrb' -exec rm -r {} \;
