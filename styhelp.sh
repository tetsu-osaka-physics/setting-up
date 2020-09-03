#!/bin/sh
cd /usr/local/tetex/share/texmf/web2c
sed -i '' -e's/teTeX/tetex/g' ./texmf.cnf
sed -i '' -e's/teTeX/tetex/g' ./texmf.cnf.ptex
sed -i '' -e's/teTeX/tetex/g' ./texmf.cnf.uptex
# mktexlsr
cd /usr/local/tetex/share/texmf/ptex/platex/tetsutex
sed -i '' -e's/teTeX/tetex/g' ./tetsuryoku.sty
sed -i '' -e's/usepackage{余白とヘッダ}/usepackage{\/usr\/local\/tetex\/share\/texmf\/ptex\/platex\/tetsutex\/余白とヘッダ}/g' ./tetsuryoku.sty
sed -i '' -e's/usepackage{機密ラベル}/usepackage{\/usr\/local\/tetex\/share\/texmf\/ptex\/platex\/tetsutex\/機密ラベル}/g' ./tetsuryoku.sty
