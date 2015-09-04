The package sp
--------------

-   classes and methods for spatial data

<!-- -->

    library(sp)

Hello world
-----------

-   A first example using data from maptools
    ([ISO2-codes](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2))

<!-- -->

    library(maptools)
    data("wrld_simpl")
    ind <- wrld_simpl@data$ISO2%in%c("FR","DE","AT","CH")
    my_map <- wrld_simpl[ind,]
    plot(my_map)

![](E_spplot_files/figure-markdown_strict/unnamed-chunk-3-1.png)

The data set
------------

    head(my_map@data)

<table>
<thead>
<tr class="header">
<th align="left"></th>
<th align="left">FIPS</th>
<th align="left">ISO2</th>
<th align="left">ISO3</th>
<th align="right">UN</th>
<th align="left">NAME</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">AUT</td>
<td align="left">AU</td>
<td align="left">AT</td>
<td align="left">AUT</td>
<td align="right">40</td>
<td align="left">Austria</td>
</tr>
<tr class="even">
<td align="left">FRA</td>
<td align="left">FR</td>
<td align="left">FR</td>
<td align="left">FRA</td>
<td align="right">250</td>
<td align="left">France</td>
</tr>
<tr class="odd">
<td align="left">DEU</td>
<td align="left">GM</td>
<td align="left">DE</td>
<td align="left">DEU</td>
<td align="right">276</td>
<td align="left">Germany</td>
</tr>
<tr class="even">
<td align="left">CHE</td>
<td align="left">SZ</td>
<td align="left">CH</td>
<td align="left">CHE</td>
<td align="right">756</td>
<td align="left">Switzerland</td>
</tr>
</tbody>
</table>

First example
-------------

    spplot(my_map,"POP2005")

![](E_spplot_files/figure-markdown_strict/unnamed-chunk-6-1.png)

Using `colorRamps`
------------------

    library(colorRamps)
    spplot(my_map,"POP2005",col.regions=blue2red(100))

![](E_spplot_files/figure-markdown_strict/unnamed-chunk-7-1.png)

Using `colorRamps`
------------------

    spplot(my_map,"POP2005",col.regions=blue2green(100))

![](E_spplot_files/figure-markdown_strict/unnamed-chunk-8-1.png)

Using `colorRamps`
------------------

    spplot(my_map,"POP2005",col.regions=green2red(100))

![](E_spplot_files/figure-markdown_strict/unnamed-chunk-9-1.png)

Using `colorRamps`
------------------

    spplot(my_map,"POP2005",col.regions=blue2yellow(100))

![](E_spplot_files/figure-markdown_strict/unnamed-chunk-10-1.png)

Using `colorRamps`
------------------

    spplot(my_map,"POP2005",col.regions=matlab.like(100))

![](E_spplot_files/figure-markdown_strict/unnamed-chunk-11-1.png)

Using synthetic data
--------------------

Generating synthetic data (Population 2010)

    my_map$Pop2010 <- my_map$POP2005 + 
    runif(length(my_map),-10000,10000)

Colors [matlab](http://de.mathworks.com/products/matlab/) like
--------------------------------------------------------------

    spplot(my_map,c("POP2005","Pop2010"),
           col.regions=matlab.like(100))

![](E_spplot_files/figure-markdown_strict/unnamed-chunk-13-1.png)

More examples
-------------

-   [Stamen maps with
    spplot](https://procomun.wordpress.com/2013/04/24/stamen-maps-with-spplot/)

-   [Know India through
    visualisation](http://justanotherdatablog.blogspot.de/2014/02/know-india-through-visualisations-1.html)

-   [Great
    circles](https://procomun.wordpress.com/2011/05/20/great-circles/)

-   [Canadian vote
    compass](http://blog.revolutionanalytics.com/2011/12/vote-compass-visualizing-canadian-poll-results-with-r.html)

-   [More colors in
    R](http://www.r-bloggers.com/using-the-new-viridis-colormap-in-r-thanks-to-simon-garnier/)

Vignettes for package `sp`
--------------------------

-   Edzer Pebesma - [Customising spatial data classes and
    methods](https://cran.r-project.org/web/packages/sp/vignettes/csdacm.pdf)

-   Edzer Pebesma and Roger S. Bivand - [S Classes and Methods for
    Spatial Data: the `sp`
    Package](https://cran.r-project.org/web/packages/sp/vignettes/intro_sp.pdf)

-   Edzer Pebesma - [Map overlay and spatial aggregation in
    sp](https://cran.r-project.org/web/packages/sp/vignettes/over.pdf)
