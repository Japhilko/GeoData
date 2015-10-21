Datasets
--------

<table>
<thead>
<tr class="header">
<th align="left">Toppics</th>
<th align="left">DataSet</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">London Soccer</td>
<td align="left">Lfb_df.csv</td>
</tr>
<tr class="even">
<td align="left">World Heritage Sites</td>
<td align="left">whcSites.csv</td>
</tr>
<tr class="odd">
<td align="left">Nursery Data</td>
<td align="left">df_pflege.csv</td>
</tr>
<tr class="even">
<td align="left">Backpacker</td>
<td align="left">Hostels_Madrid.csv</td>
</tr>
<tr class="odd">
<td align="left">Economic Crisis</td>
<td align="left">Unemployment.csv</td>
</tr>
<tr class="even">
<td align="left">Camping</td>
<td align="left">CampSites_Bayern.csv</td>
</tr>
</tbody>
</table>

London Soccer
-------------

You can find the data
[here](https://github.com/Japhilko/GeoData/tree/master/2015/data)

    url <- "https://raw.githubusercontent.com/Japhilko/
    GeoData/master/2015/data/Lfb_df.csv"

    Lfb_df <- read.csv(url) 

Overview Data - London soccer
-----------------------------

<table>
<thead>
<tr class="header">
<th align="right">X</th>
<th align="left">club</th>
<th align="left">stadium</th>
<th align="left">place</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">2</td>
<td align="left">Arsenal</td>
<td align="left">Emirates Stadium</td>
<td align="left">London</td>
</tr>
<tr class="even">
<td align="right">3</td>
<td align="left">Chelsea</td>
<td align="left">Stamford Bridge</td>
<td align="left">London</td>
</tr>
<tr class="odd">
<td align="right">4</td>
<td align="left">Crystal Palace</td>
<td align="left">Selhurst Park</td>
<td align="left">London</td>
</tr>
<tr class="even">
<td align="right">5</td>
<td align="left">Tottenham Hotspur</td>
<td align="left">White Hart Lane</td>
<td align="left">London</td>
</tr>
<tr class="odd">
<td align="right">6</td>
<td align="left">West Ham United</td>
<td align="left">Boleyn Ground</td>
<td align="left">London</td>
</tr>
<tr class="even">
<td align="right">8</td>
<td align="left">Brentford</td>
<td align="left">Griffin Park</td>
<td align="left">London</td>
</tr>
<tr class="odd">
<td align="right">9</td>
<td align="left">Charlton Athletic</td>
<td align="left">The Valley</td>
<td align="left">London</td>
</tr>
<tr class="even">
<td align="right">10</td>
<td align="left">Fulham</td>
<td align="left">Craven Cottage</td>
<td align="left">London</td>
</tr>
</tbody>
</table>

World Heritage Sites
--------------------

    url <- "https://raw.githubusercontent.com/Japhilko/
    GeoData/master/2015/data/whcSites.csv"

    whcSites <- read.csv(url) 

Overview Data - World Heritage
------------------------------

<table>
<thead>
<tr class="header">
<th align="right">X</th>
<th align="right">unique_number</th>
<th align="right">id_no</th>
<th align="left">rev_bis</th>
<th align="left">name_en</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">1</td>
<td align="right">230</td>
<td align="right">208</td>
<td align="left">Rev</td>
<td align="left">Cultural Landscape and Archaeological Remains of the Bamiyan Valley</td>
</tr>
<tr class="even">
<td align="right">2</td>
<td align="right">234</td>
<td align="right">211</td>
<td align="left">Rev</td>
<td align="left">Minaret and Archaeological Remains of Jam</td>
</tr>
<tr class="odd">
<td align="right">3</td>
<td align="right">1590</td>
<td align="right">569</td>
<td align="left">Bis</td>
<td align="left">Historic Centres of Berat and Gjirokastra</td>
</tr>
<tr class="even">
<td align="right">4</td>
<td align="right">1563</td>
<td align="right">570</td>
<td align="left">ter</td>
<td align="left">Butrint</td>
</tr>
<tr class="odd">
<td align="right">5</td>
<td align="right">111</td>
<td align="right">102</td>
<td align="left">NA</td>
<td align="left">Al Qal'a of Beni Hammad</td>
</tr>
<tr class="even">
<td align="right">6</td>
<td align="right">209</td>
<td align="right">188</td>
<td align="left">NA</td>
<td align="left">M'Zab Valley</td>
</tr>
<tr class="odd">
<td align="right">7</td>
<td align="right">212</td>
<td align="right">191</td>
<td align="left">NA</td>
<td align="left">DjÃ©mila</td>
</tr>
<tr class="even">
<td align="right">8</td>
<td align="right">215</td>
<td align="right">194</td>
<td align="left">NA</td>
<td align="left">Timgad</td>
</tr>
</tbody>
</table>

Nursery example
---------------

    url <- "https://raw.githubusercontent.com/Japhilko/
    GeoData/master/2015/data/df_pflege.csv"

    nursery <- read.csv(url) 

Overview Data - Nursery
-----------------------

<table>
<thead>
<tr class="header">
<th align="right">X</th>
<th align="left">NUTS1</th>
<th align="left">NUTS2</th>
<th align="left">AreaType</th>
<th align="right">Anz</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">1</td>
<td align="left">Brandenburg</td>
<td align="left">NA</td>
<td align="left">federal state</td>
<td align="right">527</td>
</tr>
<tr class="even">
<td align="right">2</td>
<td align="left">Berlin</td>
<td align="left">NA</td>
<td align="left">federal state</td>
<td align="right">451</td>
</tr>
<tr class="odd">
<td align="right">3</td>
<td align="left">Baden WÃƒÂ¼rttemberg</td>
<td align="left">NA</td>
<td align="left">federal state</td>
<td align="right">1929</td>
</tr>
<tr class="even">
<td align="right">4</td>
<td align="left">Bayern</td>
<td align="left">NA</td>
<td align="left">federal state</td>
<td align="right">2195</td>
</tr>
<tr class="odd">
<td align="right">5</td>
<td align="left">Bremen</td>
<td align="left">NA</td>
<td align="left">federal state</td>
<td align="right">175</td>
</tr>
<tr class="even">
<td align="right">6</td>
<td align="left">Hessen</td>
<td align="left">NA</td>
<td align="left">federal state</td>
<td align="right">1013</td>
</tr>
<tr class="odd">
<td align="right">7</td>
<td align="left">Hamburg</td>
<td align="left">NA</td>
<td align="left">federal state</td>
<td align="right">240</td>
</tr>
<tr class="even">
<td align="right">8</td>
<td align="left">Mecklenburg Vorpommern</td>
<td align="left">NA</td>
<td align="left">federal state</td>
<td align="right">395</td>
</tr>
</tbody>
</table>

Backpacker example
------------------

    url <- "https://raw.githubusercontent.com/Japhilko/
    GeoData/master/2015/data/Hostels_Madrid.csv"

    Hostels <- read.csv(url) 

Overview Data - Hostels
-----------------------

<table>
<thead>
<tr class="header">
<th align="right">X</th>
<th align="left">created_by</th>
<th align="left">name</th>
<th align="left">phone</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">143098199</td>
<td align="left">JOSM</td>
<td align="left">Habitaciones &quot;ArÃ¡nzazu&quot;</td>
<td align="left">917291572</td>
</tr>
<tr class="even">
<td align="right">151223418</td>
<td align="left">JOSM</td>
<td align="left">PensiÃ³n &quot;MÃ³nica&quot;</td>
<td align="left">913584778</td>
</tr>
<tr class="odd">
<td align="right">286312700</td>
<td align="left">Potlatch 0.10b</td>
<td align="left">Albergue Juvenil</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="right">621118487</td>
<td align="left">NA</td>
<td align="left">La HospederÃ­a de Antonia</td>
<td align="left">91 884 49 75</td>
</tr>
<tr class="odd">
<td align="right">1013493190</td>
<td align="left">NA</td>
<td align="left">Alaska</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="right">1572572830</td>
<td align="left">NA</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="right">1743983862</td>
<td align="left">NA</td>
<td align="left">Ballesta</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="right">1819460987</td>
<td align="left">NA</td>
<td align="left">Acogida de Peregrino Cercedilla</td>
<td align="left">NA</td>
</tr>
</tbody>
</table>

Example - Economic crisis
-------------------------

    url <- "https://raw.githubusercontent.com/Japhilko/
    GeoData/master/2015/data/Unemployment.csv"

    Hostels <- read.csv(url) 

Overview Data - Unemployment
----------------------------

<table>
<thead>
<tr class="header">
<th align="right">X</th>
<th align="left">geo</th>
<th align="right">X2014M10</th>
<th align="right">X2014M11</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">1</td>
<td align="left">Euro area (changing composition)</td>
<td align="right">11.5</td>
<td align="right">11.5</td>
</tr>
<tr class="even">
<td align="right">2</td>
<td align="left">Euro area (19 countries)</td>
<td align="right">11.5</td>
<td align="right">11.5</td>
</tr>
<tr class="odd">
<td align="right">3</td>
<td align="left">Euro area (18 countries)</td>
<td align="right">11.5</td>
<td align="right">11.5</td>
</tr>
<tr class="even">
<td align="right">4</td>
<td align="left">EU (28 countries)</td>
<td align="right">10.0</td>
<td align="right">10.0</td>
</tr>
<tr class="odd">
<td align="right">5</td>
<td align="left">EU (27 countries)</td>
<td align="right">10.0</td>
<td align="right">9.9</td>
</tr>
<tr class="even">
<td align="right">6</td>
<td align="left">Belgium</td>
<td align="right">8.6</td>
<td align="right">8.6</td>
</tr>
<tr class="odd">
<td align="right">7</td>
<td align="left">Bulgaria</td>
<td align="right">10.9</td>
<td align="right">10.6</td>
</tr>
<tr class="even">
<td align="right">8</td>
<td align="left">Czech Republic</td>
<td align="right">5.8</td>
<td align="right">5.9</td>
</tr>
</tbody>
</table>

Example - Camping
-----------------

    url <- "https://raw.githubusercontent.com/Japhilko/
    GeoData/master/2015/data/CampSites_Bayern.csv"

    CampSites <- read.csv(url) 

Overview Data - Camp Sites in Bayern
------------------------------------

<table>
<thead>
<tr class="header">
<th align="right">X</th>
<th align="left">addr.city</th>
<th align="left">addr.country</th>
<th align="left">addr.housenumber</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">97870691</td>
<td align="left">Passau</td>
<td align="left">DE</td>
<td align="left">34</td>
</tr>
<tr class="even">
<td align="right">255303075</td>
<td align="left">Klingenberg/Trennfurt</td>
<td align="left">DE</td>
<td align="left">3</td>
</tr>
<tr class="odd">
<td align="right">266549090</td>
<td align="left">NA</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="right">277815437</td>
<td align="left">NA</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="right">287216441</td>
<td align="left">NA</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="right">294791120</td>
<td align="left">NA</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="right">294791122</td>
<td align="left">NA</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="right">294822115</td>
<td align="left">NA</td>
<td align="left">NA</td>
<td align="left">NA</td>
</tr>
</tbody>
</table>
