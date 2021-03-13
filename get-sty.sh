#!/bin/sh
echo "Upgrade all Packages? (may take longer) [1/2]"
select VAR in Yes No
do
  if [ "$VAR" = "Yes" ]; then
    brew update && brew upgrade --greedy && brew cleanup --prune=all
    sudo tlmgr update --self --all
  else
    break
  fi
done

sudo rm -rf /usr/local/texlive/texmf-local/tex/latex/local/tetsu_physic
cd /usr/local/texlive/texmf-local/tex/latex/local
sudo git clone https://github.com/tetsu-osaka-physics/tetsu_physic.git tetsu_physic
sudo rm -rf /usr/local/texlive/texmf-local/tex/latex/local/tetsu_physic/.git
sudo mktexlsr
