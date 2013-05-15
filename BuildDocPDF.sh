##############
# Move Rnw Documentation to simPH package
# Christopher Gandrud
# 15 May 2013
##############


#!/bin/bash

#### Commit simPH changes
cd /git_repositories/simPH

git add .
git commit -am "Committed by bash"
git checkout master

cp -i /git_repositories/simPHDoc/PDF/simPH_vignette.Rnw /git_repositories/simPH/vignettes

cp -i /git_repositories/simPHDoc/PDF/HRBibliography.bib /git_repositories/simPH/vignettes
