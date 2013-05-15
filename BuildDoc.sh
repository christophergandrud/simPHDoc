##############
# Create Documentation for simPH package
# Christopher Gandrud
# 15 May 2013
##############


#!/bin/bash


#### Convert knitted PDF file to html with pandoc ####
cd /git_repositories/simPHDoc/HTML
pandoc simPH_vignette.tex -0 simPHDoc.html --bibliography HRBibliography.bib --bibliography HRPackages.bib

#### Move files to the gh-pages branch of simPH ####
cd /git_repositories/simPH

# Commit changes and change to gh-pages branch
git add .
git commit -am "Committed by bash"
git checkout gh-pages

# Move files
mv -i /git_repositories/simPHDoc/HTML/simPHDoc.html /git_repositories/simPH

cp -i /git_repositories/simPHDoc/PDF/figure /git_repositories/simPH