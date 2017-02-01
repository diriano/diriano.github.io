#Turn bibliography in from a bibtex file into HTML
# Requires bibtex2html which in turn requires Objective Calm

bibtex2html -d -r -t 'BCES Publications' -noabstract -nokeywords -noheader -nofooter dmrpPublications.bib 
head -n 65 links.html |sed 's/<title>BCES - Links<\/title>/<title>BCES - Publications<\/title>/' > publications.html
grep --after-context `wc -l dmrpPublications.html |sed -E 's/^ *//'|cut -f 1 -d' '` '<h1>BCES Publications</h1>' dmrpPublications.html |sed 's#</body>##'|sed 's#</html>##' >> publications.html
tail -n 12 links.html >> publications.html
sed -i bak 's/dmrpPublications\.html/publications.html/' dmrpPublications_bib.html
head -n 65 links.html |sed 's/<title>BCES - Links<\/title>/<title>BCES - Publications bibtex<\/title>/' > dmrpPublications_bib2.html
grep --after-context `wc -l dmrpPublications_bib.html |sed -E 's/^ *//'|cut -f 1 -d' '` '<h1>dmrpPublications.bib</h1>' dmrpPublications_bib.html |sed 's#</body>##'|sed 's#</html>##' >> dmrpPublications_bib2.html
tail -n 12 links.html >> dmrpPublications_bib2.html
mv dmrpPublications_bib2.html dmrpPublications_bib.html
rm dmrpPublications_bib.htmlbak
rm dmrpPublications.html
