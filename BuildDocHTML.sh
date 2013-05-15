##############
# Create Documentation for simPH package
# Christopher Gandrud
# 15 May 2013
##############


#!/bin/bash


#### Convert knitted PDF file to html with pandoc ####
cd /git_repositories/simPHDoc/PDF
pandoc simPH_vignette.tex -o simPHDoc.html --mathjax --bibliography HRBibliography.bib --bibliography HRPackages.bib

# Clean up


# Combine with header and footer
cd /git_repositories/simPHDoc/HTML
cat simDocHeader.htm /git_repositories/simPHDoc/PDF/simPHDoc.html simDocFooter.htm >> fullDoc.html

#### Move files to the gh-pages branch of simPH ####
cd /git_repositories/simPH

# Commit changes and change to gh-pages branch
Branch=$(git branch)

if [ "$Branch" = "* gh-pages" ]
then
	# Move files
	mv -i /git_repositories/simPHDoc/HTML/fullDoc.html /git_repositories/simPH
	rm /git_repositories/simPHDoc/HTML/fullDoc.html

	cp -ir /git_repositories/simPHDoc/PDF/figure /git_repositories/simPH
else
	git branch 
	git add .
	git commit -am "Committed by bash"
	git checkout gh-pages

	# Move files
	mv -i /git_repositories/simPHDoc/HTML/fullDoc.html /git_repositories/simPH

	cp -ir /git_repositories/simPHDoc/PDF/figure /git_repositories/simPH
fi


######## Some manual clean up required ###############

