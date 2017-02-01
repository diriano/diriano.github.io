#Turn bibliography in from a bibtex file into HTML
# Requires bibtex2html which in turn requires Objective Calm

bibtex2html -d -r -t 'BCES Publications' -noabstract -nokeywords -noheader -nofooter dmrpPublications.bib 
head -n 56 links.html |sed 's/<title>BCES - Links<\/title>/<title>BCES - Publications<\/title>/' > publications.html
grep --after-context `wc -l dmrpPublications.html |sed -E 's/^ *//'|cut -f 1 -d' '` '<h1>BCES Publications</h1>' dmrpPublications.html |sed 's#</body>##'|sed 's#</html>##' >> publications.html
tail -n 12 links.html >> ~/publications.php
rm dmrpPublications.html
