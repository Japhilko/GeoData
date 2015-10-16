
# http://linkedscience.org/tools/sparql-package-for-r/sparql-package-for-r-gephi-movie-star-graph-visualization-tutorial/

endpoint <- "http://live.dbpedia.org/sparql"

options <- NULL

prefix <- c("db","http://dbpedia.org/resource/")

sparql_prefix <- "PREFIX dbp: <http://dbpedia.org/property/>
                  PREFIX dc: <http://purl.org/dc/terms/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
"

q <- paste(sparql_prefix,
           'SELECT ?actor ?movie ?director ?movie_date
           WHERE {
           ?m dc:subject <http://dbpedia.org/resource/Category:American_films> .
           ?m rdfs:label ?movie .
           FILTER(LANG(?movie) = "en")
           ?m dbp:released ?movie_date .
           FILTER(DATATYPE(?movie_date) = xsd:date)
           ?m dbp:starring ?a .
           ?a rdfs:label ?actor .
           FILTER(LANG(?actor) = "en")
           ?m dbp:director ?d .
           ?d rdfs:label ?director .
           FILTER(LANG(?director) = "en")
           }')

res <- SPARQL(endpoint,q,ns=prefix,extra=options)$results

res

#---------------------------------------------------------------#

# https://www.ebi.ac.uk/rdf/querying-sparql-r


q <- "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX atlas: <http://rdf.ebi.ac.uk/resource/atlas/>
PREFIX atlasterms: <http://rdf.ebi.ac.uk/terms/atlas/>
SELECT DISTINCT ?genename ?factorLabel ?tStat WHERE {
atlas:E-GEOD-8527 atlasterms:hasAnalysis ?analysis . 
?analysis atlasterms:hasExpressionValue ?value . 
?value atlasterms:pValue ?pvalue . 
?value atlasterms:tStatistic ?tStat . 
?value atlasterms:hasFactorValue ?factor .
?factor atlasterms:propertyValue ?factorLabel .
?value atlasterms:isMeasurementOf ?probe . 
?probe atlasterms:dbXref ?dbXref .
?dbXref rdfs:label ?genename .
} ORDER BY ?genename limit 10000"

d <- SPARQL(url="http://www.ebi.ac.uk/rdf/services/atlas/sparql",
            query=q)

#---------------------------------------------------------------#
# Links
#---------------------------------------------------------------#

# https://code.google.com/p/r-sparql/wiki/GettingStarted
# http://semanticweb.cs.vu.nl/R/sparql_lop/sparql_lop.html