#!/bin/sh
brew update && brew upgrade --greedy && brew cleanup
sudo tlmgr update --self --all
sudo rm -rf /usr/local/texlive/texmf-local/tex/latex/local/tetsu_physic
cd /usr/local/texlive/texmf-local/tex/latex/local
sudo git clone https://github.com/tetsu-osaka-physics/tetsu_physic.git tetsu_physic
sudo rm -rf /usr/local/texlive/texmf-local/tex/latex/local/tetsu_physic/.git
sudo mktexlsr
