Intro R
-------

<http://manuals.bioinformatics.ucr.edu/home/programming-in-r>

use api's
---------

    # http://www.informit.com/articles/article.aspx?p=2215520
    library(downloader)

    # http://cran.r-project.org/web/views/WebTechnologies.html
    require("XML")
    require("plyr")
    require("ggplot2")
    require("gridExtra")
    library(RCurl)
    library(V8)
    library(rJava)

    # http://civilstat.com/2012/10/basics-of-javascript-and-d3-for-r-users/
    library(r2d3)

    library(htmlwidgets)

Javascript
----------

<http://www.dateiendung.com/format/js>

R and Javascript
----------------

<http://www.r-bloggers.com/statistical-computation-in-javascript-am-i-nuts/>

<http://www.htmlwidgets.org/>

Running javascript using V8
---------------------------

    library(V8)
    data(diamonds, package="ggplot2")
    ct <- new_context()
    ct$assign("diamonds", diamonds)

    # Load CrossFilter JavaScript library
    ct$source("http://cdnjs.cloudflare.com/ajax/libs/crossfilter/1.3.11/crossfilter.min.js")

    ct$console()

openlayers
----------

<http://openlayers.org/en/v3.2.0/doc/tutorials/introduction.html>

R and Hadoop
------------

<https://github.com/RevolutionAnalytics/RHadoop/wiki>

    # http://rapache.net/

Further links
-------------

<http://www.r-bloggers.com/introducing-v8-an-embedded-javascript-engine-for-r/>

<http://jsfiddle.net/user/opencpu/fiddles/>

<https://www.opencpu.org/posts/v8-release-0-2/>
<https://www.r-bloggers.com/introducing-v8-an-embedded-javascript-engine-for-r/>

<http://rforge.net/JRI/index.html>

    system.file("jri",package="rJava")

Popularity R
------------

<http://www.gulli.com/news/23740-programmiersprache-r-in-der-wissenschaft-immer-beliebter-2014-04-24>

<http://community.oreilly.de/blog/2011/01/18/statistiksoftware-r/>

<http://www.nytimes.com/2009/01/07/technology/business-computing/07program.html?_r=0>

Some helpers
------------

<http://www.w3schools.com/html/html_intro.asp>

Open CPU
--------

<https://www.opencpu.org/>

Julia Language
--------------

<http://julialang.org/learning/>

<http://www.inwt-statistics.de/blog-artikel-lesen/Statistik-Software_R.html>

<https://github.com/openlayers/openlayers>

Further Languages
-----------------

<http://www.rzbt.haw-hamburg.de/dankert/ccppjava.html/>

Python
------

<http://civilstat.com/2012/10/javascript-and-d3-for-r-users-part-2-running-off-the-r-server-instead-of-python/>

Java
----

<http://clojure.org/>

getting to know html
--------------------

<https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Introduction>

Links
-----

<http://www.r-bloggers.com/become-an-effective-data-hacker-with-the-r-hadoop-stack/>
<http://blog.revolutionanalytics.com/2011/09/mapreduce-hadoop-r.html>
