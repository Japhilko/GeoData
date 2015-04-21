The library maptools
--------------------

-   The data set wrld\_simpl has polygons for the most countries in the
    world

<!-- -->

    library(maptools)

    ## Loading required package: sp
    ## Checking rgeos availability: TRUE

    data(wrld_simpl)

Hello world
-----------

    plot(wrld_simpl)

![](B_maptools_files/figure-markdown_strict/unnamed-chunk-2-1.png)

The data set behind
-------------------

    head(wrld_simpl)

<table>
<tbody>
<tr class="odd">
<td align="left">ATG</td>
<td align="left">AC</td>
<td align="left">AG</td>
<td align="left">ATG</td>
<td align="right">28</td>
<td align="left">Antigua and Barbuda</td>
<td align="right">44</td>
</tr>
<tr class="even">
<td align="left">DZA</td>
<td align="left">AG</td>
<td align="left">DZ</td>
<td align="left">DZA</td>
<td align="right">12</td>
<td align="left">Algeria</td>
<td align="right">238174</td>
</tr>
<tr class="odd">
<td align="left">AZE</td>
<td align="left">AJ</td>
<td align="left">AZ</td>
<td align="left">AZE</td>
<td align="right">31</td>
<td align="left">Azerbaijan</td>
<td align="right">8260</td>
</tr>
<tr class="even">
<td align="left">ALB</td>
<td align="left">AL</td>
<td align="left">AL</td>
<td align="left">ALB</td>
<td align="right">8</td>
<td align="left">Albania</td>
<td align="right">2740</td>
</tr>
<tr class="odd">
<td align="left">ARM</td>
<td align="left">AM</td>
<td align="left">AM</td>
<td align="left">ARM</td>
<td align="right">51</td>
<td align="left">Armenia</td>
<td align="right">2820</td>
</tr>
<tr class="even">
<td align="left">AGO</td>
<td align="left">AO</td>
<td align="left">AO</td>
<td align="left">AGO</td>
<td align="right">24</td>
<td align="left">Angola</td>
<td align="right">124670</td>
</tr>
<tr class="odd">
<td align="left">ASM</td>
<td align="left">AQ</td>
<td align="left">AS</td>
<td align="left">ASM</td>
<td align="right">16</td>
<td align="left">American Samoa</td>
<td align="right">20</td>
</tr>
<tr class="even">
<td align="left">ARG</td>
<td align="left">AR</td>
<td align="left">AR</td>
<td align="left">ARG</td>
<td align="right">32</td>
<td align="left">Argentina</td>
<td align="right">273669</td>
</tr>
<tr class="odd">
<td align="left">AUS</td>
<td align="left">AS</td>
<td align="left">AU</td>
<td align="left">AUS</td>
<td align="right">36</td>
<td align="left">Australia</td>
<td align="right">768230</td>
</tr>
<tr class="even">
<td align="left">BHR</td>
<td align="left">BA</td>
<td align="left">BH</td>
<td align="left">BHR</td>
<td align="right">48</td>
<td align="left">Bahrain</td>
<td align="right">71</td>
</tr>
<tr class="odd">
<td align="left">BRB</td>
<td align="left">BB</td>
<td align="left">BB</td>
<td align="left">BRB</td>
<td align="right">52</td>
<td align="left">Barbados</td>
<td align="right">43</td>
</tr>
<tr class="even">
<td align="left">BMU</td>
<td align="left">BD</td>
<td align="left">BM</td>
<td align="left">BMU</td>
<td align="right">60</td>
<td align="left">Bermuda</td>
<td align="right">5</td>
</tr>
<tr class="odd">
<td align="left">BHS</td>
<td align="left">BF</td>
<td align="left">BS</td>
<td align="left">BHS</td>
<td align="right">44</td>
<td align="left">Bahamas</td>
<td align="right">1001</td>
</tr>
<tr class="even">
<td align="left">BGD</td>
<td align="left">BG</td>
<td align="left">BD</td>
<td align="left">BGD</td>
<td align="right">50</td>
<td align="left">Bangladesh</td>
<td align="right">13017</td>
</tr>
<tr class="odd">
<td align="left">BLZ</td>
<td align="left">BH</td>
<td align="left">BZ</td>
<td align="left">BLZ</td>
<td align="right">84</td>
<td align="left">Belize</td>
<td align="right">2281</td>
</tr>
<tr class="even">
<td align="left">BIH</td>
<td align="left">BK</td>
<td align="left">BA</td>
<td align="left">BIH</td>
<td align="right">70</td>
<td align="left">Bosnia and Herzegovina</td>
<td align="right">5120</td>
</tr>
<tr class="odd">
<td align="left">BOL</td>
<td align="left">BL</td>
<td align="left">BO</td>
<td align="left">BOL</td>
<td align="right">68</td>
<td align="left">Bolivia</td>
<td align="right">108438</td>
</tr>
<tr class="even">
<td align="left">MMR</td>
<td align="left">BM</td>
<td align="left">MM</td>
<td align="left">MMR</td>
<td align="right">104</td>
<td align="left">Burma</td>
<td align="right">65755</td>
</tr>
<tr class="odd">
<td align="left">BEN</td>
<td align="left">BN</td>
<td align="left">BJ</td>
<td align="left">BEN</td>
<td align="right">204</td>
<td align="left">Benin</td>
<td align="right">11062</td>
</tr>
<tr class="even">
<td align="left">SLB</td>
<td align="left">BP</td>
<td align="left">SB</td>
<td align="left">SLB</td>
<td align="right">90</td>
<td align="left">Solomon Islands</td>
<td align="right">2799</td>
</tr>
<tr class="odd">
<td align="left">BRA</td>
<td align="left">BR</td>
<td align="left">BR</td>
<td align="left">BRA</td>
<td align="right">76</td>
<td align="left">Brazil</td>
<td align="right">845942</td>
</tr>
<tr class="even">
<td align="left">BGR</td>
<td align="left">BU</td>
<td align="left">BG</td>
<td align="left">BGR</td>
<td align="right">100</td>
<td align="left">Bulgaria</td>
<td align="right">11063</td>
</tr>
<tr class="odd">
<td align="left">BRN</td>
<td align="left">BX</td>
<td align="left">BN</td>
<td align="left">BRN</td>
<td align="right">96</td>
<td align="left">Brunei Darussalam</td>
<td align="right">527</td>
</tr>
<tr class="even">
<td align="left">CAN</td>
<td align="left">CA</td>
<td align="left">CA</td>
<td align="left">CAN</td>
<td align="right">124</td>
<td align="left">Canada</td>
<td align="right">909351</td>
</tr>
<tr class="odd">
<td align="left">KHM</td>
<td align="left">CB</td>
<td align="left">KH</td>
<td align="left">KHM</td>
<td align="right">116</td>
<td align="left">Cambodia</td>
<td align="right">17652</td>
</tr>
<tr class="even">
<td align="left">LKA</td>
<td align="left">CE</td>
<td align="left">LK</td>
<td align="left">LKA</td>
<td align="right">144</td>
<td align="left">Sri Lanka</td>
<td align="right">6463</td>
</tr>
<tr class="odd">
<td align="left">COG</td>
<td align="left">CF</td>
<td align="left">CG</td>
<td align="left">COG</td>
<td align="right">178</td>
<td align="left">Congo</td>
<td align="right">34150</td>
</tr>
<tr class="even">
<td align="left">COD</td>
<td align="left">CG</td>
<td align="left">CD</td>
<td align="left">COD</td>
<td align="right">180</td>
<td align="left">Democratic Republic of the Congo</td>
<td align="right">226705</td>
</tr>
<tr class="odd">
<td align="left">BDI</td>
<td align="left">BY</td>
<td align="left">BI</td>
<td align="left">BDI</td>
<td align="right">108</td>
<td align="left">Burundi</td>
<td align="right">2568</td>
</tr>
<tr class="even">
<td align="left">CHN</td>
<td align="left">CH</td>
<td align="left">CN</td>
<td align="left">CHN</td>
<td align="right">156</td>
<td align="left">China</td>
<td align="right">932743</td>
</tr>
<tr class="odd">
<td align="left">AFG</td>
<td align="left">AF</td>
<td align="left">AF</td>
<td align="left">AFG</td>
<td align="right">4</td>
<td align="left">Afghanistan</td>
<td align="right">65209</td>
</tr>
<tr class="even">
<td align="left">BTN</td>
<td align="left">BT</td>
<td align="left">BT</td>
<td align="left">BTN</td>
<td align="right">64</td>
<td align="left">Bhutan</td>
<td align="right">4700</td>
</tr>
<tr class="odd">
<td align="left">CHL</td>
<td align="left">CI</td>
<td align="left">CL</td>
<td align="left">CHL</td>
<td align="right">152</td>
<td align="left">Chile</td>
<td align="right">74880</td>
</tr>
<tr class="even">
<td align="left">CYM</td>
<td align="left">CJ</td>
<td align="left">KY</td>
<td align="left">CYM</td>
<td align="right">136</td>
<td align="left">Cayman Islands</td>
<td align="right">26</td>
</tr>
<tr class="odd">
<td align="left">CMR</td>
<td align="left">CM</td>
<td align="left">CM</td>
<td align="left">CMR</td>
<td align="right">120</td>
<td align="left">Cameroon</td>
<td align="right">46540</td>
</tr>
<tr class="even">
<td align="left">TCD</td>
<td align="left">CD</td>
<td align="left">TD</td>
<td align="left">TCD</td>
<td align="right">148</td>
<td align="left">Chad</td>
<td align="right">125920</td>
</tr>
<tr class="odd">
<td align="left">COM</td>
<td align="left">CN</td>
<td align="left">KM</td>
<td align="left">COM</td>
<td align="right">174</td>
<td align="left">Comoros</td>
<td align="right">223</td>
</tr>
<tr class="even">
<td align="left">COL</td>
<td align="left">CO</td>
<td align="left">CO</td>
<td align="left">COL</td>
<td align="right">170</td>
<td align="left">Colombia</td>
<td align="right">103870</td>
</tr>
<tr class="odd">
<td align="left">CRI</td>
<td align="left">CS</td>
<td align="left">CR</td>
<td align="left">CRI</td>
<td align="right">188</td>
<td align="left">Costa Rica</td>
<td align="right">5106</td>
</tr>
<tr class="even">
<td align="left">CAF</td>
<td align="left">CT</td>
<td align="left">CF</td>
<td align="left">CAF</td>
<td align="right">140</td>
<td align="left">Central African Republic</td>
<td align="right">62298</td>
</tr>
<tr class="odd">
<td align="left">CUB</td>
<td align="left">CU</td>
<td align="left">CU</td>
<td align="left">CUB</td>
<td align="right">192</td>
<td align="left">Cuba</td>
<td align="right">10982</td>
</tr>
<tr class="even">
<td align="left">CPV</td>
<td align="left">CV</td>
<td align="left">CV</td>
<td align="left">CPV</td>
<td align="right">132</td>
<td align="left">Cape Verde</td>
<td align="right">403</td>
</tr>
<tr class="odd">
<td align="left">COK</td>
<td align="left">CW</td>
<td align="left">CK</td>
<td align="left">COK</td>
<td align="right">184</td>
<td align="left">Cook Islands</td>
<td align="right">24</td>
</tr>
<tr class="even">
<td align="left">CYP</td>
<td align="left">CY</td>
<td align="left">CY</td>
<td align="left">CYP</td>
<td align="right">196</td>
<td align="left">Cyprus</td>
<td align="right">924</td>
</tr>
<tr class="odd">
<td align="left">DNK</td>
<td align="left">DA</td>
<td align="left">DK</td>
<td align="left">DNK</td>
<td align="right">208</td>
<td align="left">Denmark</td>
<td align="right">4243</td>
</tr>
<tr class="even">
<td align="left">DJI</td>
<td align="left">DJ</td>
<td align="left">DJ</td>
<td align="left">DJI</td>
<td align="right">262</td>
<td align="left">Djibouti</td>
<td align="right">2318</td>
</tr>
<tr class="odd">
<td align="left">DMA</td>
<td align="left">DO</td>
<td align="left">DM</td>
<td align="left">DMA</td>
<td align="right">212</td>
<td align="left">Dominica</td>
<td align="right">75</td>
</tr>
<tr class="even">
<td align="left">DOM</td>
<td align="left">DR</td>
<td align="left">DO</td>
<td align="left">DOM</td>
<td align="right">214</td>
<td align="left">Dominican Republic</td>
<td align="right">4838</td>
</tr>
<tr class="odd">
<td align="left">ECU</td>
<td align="left">EC</td>
<td align="left">EC</td>
<td align="left">ECU</td>
<td align="right">218</td>
<td align="left">Ecuador</td>
<td align="right">27684</td>
</tr>
<tr class="even">
<td align="left">EGY</td>
<td align="left">EG</td>
<td align="left">EG</td>
<td align="left">EGY</td>
<td align="right">818</td>
<td align="left">Egypt</td>
<td align="right">99545</td>
</tr>
<tr class="odd">
<td align="left">IRL</td>
<td align="left">EI</td>
<td align="left">IE</td>
<td align="left">IRL</td>
<td align="right">372</td>
<td align="left">Ireland</td>
<td align="right">6889</td>
</tr>
<tr class="even">
<td align="left">GNQ</td>
<td align="left">EK</td>
<td align="left">GQ</td>
<td align="left">GNQ</td>
<td align="right">226</td>
<td align="left">Equatorial Guinea</td>
<td align="right">2805</td>
</tr>
<tr class="odd">
<td align="left">EST</td>
<td align="left">EN</td>
<td align="left">EE</td>
<td align="left">EST</td>
<td align="right">233</td>
<td align="left">Estonia</td>
<td align="right">4239</td>
</tr>
<tr class="even">
<td align="left">ERI</td>
<td align="left">ER</td>
<td align="left">ER</td>
<td align="left">ERI</td>
<td align="right">232</td>
<td align="left">Eritrea</td>
<td align="right">10100</td>
</tr>
<tr class="odd">
<td align="left">SLV</td>
<td align="left">ES</td>
<td align="left">SV</td>
<td align="left">SLV</td>
<td align="right">222</td>
<td align="left">El Salvador</td>
<td align="right">2072</td>
</tr>
<tr class="even">
<td align="left">ETH</td>
<td align="left">ET</td>
<td align="left">ET</td>
<td align="left">ETH</td>
<td align="right">231</td>
<td align="left">Ethiopia</td>
<td align="right">100000</td>
</tr>
<tr class="odd">
<td align="left">AUT</td>
<td align="left">AU</td>
<td align="left">AT</td>
<td align="left">AUT</td>
<td align="right">40</td>
<td align="left">Austria</td>
<td align="right">8245</td>
</tr>
<tr class="even">
<td align="left">CZE</td>
<td align="left">EZ</td>
<td align="left">CZ</td>
<td align="left">CZE</td>
<td align="right">203</td>
<td align="left">Czech Republic</td>
<td align="right">7727</td>
</tr>
<tr class="odd">
<td align="left">GUF</td>
<td align="left">FG</td>
<td align="left">GF</td>
<td align="left">GUF</td>
<td align="right">254</td>
<td align="left">French Guiana</td>
<td align="right">8815</td>
</tr>
<tr class="even">
<td align="left">FIN</td>
<td align="left">FI</td>
<td align="left">FI</td>
<td align="left">FIN</td>
<td align="right">246</td>
<td align="left">Finland</td>
<td align="right">30459</td>
</tr>
<tr class="odd">
<td align="left">FJI</td>
<td align="left">FJ</td>
<td align="left">FJ</td>
<td align="left">FJI</td>
<td align="right">242</td>
<td align="left">Fiji</td>
<td align="right">1827</td>
</tr>
<tr class="even">
<td align="left">FLK</td>
<td align="left">FK</td>
<td align="left">FK</td>
<td align="left">FLK</td>
<td align="right">238</td>
<td align="left">Falkland Islands (Malvinas)</td>
<td align="right">1217</td>
</tr>
<tr class="odd">
<td align="left">FSM</td>
<td align="left">FM</td>
<td align="left">FM</td>
<td align="left">FSM</td>
<td align="right">583</td>
<td align="left">Micronesia, Federated States of</td>
<td align="right">70</td>
</tr>
<tr class="even">
<td align="left">PYF</td>
<td align="left">FP</td>
<td align="left">PF</td>
<td align="left">PYF</td>
<td align="right">258</td>
<td align="left">French Polynesia</td>
<td align="right">366</td>
</tr>
<tr class="odd">
<td align="left">FRA</td>
<td align="left">FR</td>
<td align="left">FR</td>
<td align="left">FRA</td>
<td align="right">250</td>
<td align="left">France</td>
<td align="right">55010</td>
</tr>
<tr class="even">
<td align="left">GMB</td>
<td align="left">GA</td>
<td align="left">GM</td>
<td align="left">GMB</td>
<td align="right">270</td>
<td align="left">Gambia</td>
<td align="right">1000</td>
</tr>
<tr class="odd">
<td align="left">GAB</td>
<td align="left">GB</td>
<td align="left">GA</td>
<td align="left">GAB</td>
<td align="right">266</td>
<td align="left">Gabon</td>
<td align="right">25767</td>
</tr>
<tr class="even">
<td align="left">GEO</td>
<td align="left">GG</td>
<td align="left">GE</td>
<td align="left">GEO</td>
<td align="right">268</td>
<td align="left">Georgia</td>
<td align="right">6949</td>
</tr>
<tr class="odd">
<td align="left">GHA</td>
<td align="left">GH</td>
<td align="left">GH</td>
<td align="left">GHA</td>
<td align="right">288</td>
<td align="left">Ghana</td>
<td align="right">22754</td>
</tr>
<tr class="even">
<td align="left">GRD</td>
<td align="left">GJ</td>
<td align="left">GD</td>
<td align="left">GRD</td>
<td align="right">308</td>
<td align="left">Grenada</td>
<td align="right">34</td>
</tr>
<tr class="odd">
<td align="left">GRL</td>
<td align="left">GL</td>
<td align="left">GL</td>
<td align="left">GRL</td>
<td align="right">304</td>
<td align="left">Greenland</td>
<td align="right">41045</td>
</tr>
<tr class="even">
<td align="left">DEU</td>
<td align="left">GM</td>
<td align="left">DE</td>
<td align="left">DEU</td>
<td align="right">276</td>
<td align="left">Germany</td>
<td align="right">34895</td>
</tr>
<tr class="odd">
<td align="left">GUM</td>
<td align="left">GQ</td>
<td align="left">GU</td>
<td align="left">GUM</td>
<td align="right">316</td>
<td align="left">Guam</td>
<td align="right">55</td>
</tr>
<tr class="even">
<td align="left">GRC</td>
<td align="left">GR</td>
<td align="left">GR</td>
<td align="left">GRC</td>
<td align="right">300</td>
<td align="left">Greece</td>
<td align="right">12890</td>
</tr>
<tr class="odd">
<td align="left">GTM</td>
<td align="left">GT</td>
<td align="left">GT</td>
<td align="left">GTM</td>
<td align="right">320</td>
<td align="left">Guatemala</td>
<td align="right">10843</td>
</tr>
<tr class="even">
<td align="left">GIN</td>
<td align="left">GV</td>
<td align="left">GN</td>
<td align="left">GIN</td>
<td align="right">324</td>
<td align="left">Guinea</td>
<td align="right">24572</td>
</tr>
<tr class="odd">
<td align="left">GUY</td>
<td align="left">GY</td>
<td align="left">GY</td>
<td align="left">GUY</td>
<td align="right">328</td>
<td align="left">Guyana</td>
<td align="right">19685</td>
</tr>
<tr class="even">
<td align="left">HTI</td>
<td align="left">HA</td>
<td align="left">HT</td>
<td align="left">HTI</td>
<td align="right">332</td>
<td align="left">Haiti</td>
<td align="right">2756</td>
</tr>
<tr class="odd">
<td align="left">HND</td>
<td align="left">HO</td>
<td align="left">HN</td>
<td align="left">HND</td>
<td align="right">340</td>
<td align="left">Honduras</td>
<td align="right">11189</td>
</tr>
<tr class="even">
<td align="left">HRV</td>
<td align="left">HR</td>
<td align="left">HR</td>
<td align="left">HRV</td>
<td align="right">191</td>
<td align="left">Croatia</td>
<td align="right">5592</td>
</tr>
<tr class="odd">
<td align="left">HUN</td>
<td align="left">HU</td>
<td align="left">HU</td>
<td align="left">HUN</td>
<td align="right">348</td>
<td align="left">Hungary</td>
<td align="right">9210</td>
</tr>
<tr class="even">
<td align="left">ISL</td>
<td align="left">IC</td>
<td align="left">IS</td>
<td align="left">ISL</td>
<td align="right">352</td>
<td align="left">Iceland</td>
<td align="right">10025</td>
</tr>
<tr class="odd">
<td align="left">IND</td>
<td align="left">IN</td>
<td align="left">IN</td>
<td align="left">IND</td>
<td align="right">356</td>
<td align="left">India</td>
<td align="right">297319</td>
</tr>
<tr class="even">
<td align="left">IRN</td>
<td align="left">IR</td>
<td align="left">IR</td>
<td align="left">IRN</td>
<td align="right">364</td>
<td align="left">Iran (Islamic Republic of)</td>
<td align="right">163620</td>
</tr>
<tr class="odd">
<td align="left">ISR</td>
<td align="left">IS</td>
<td align="left">IL</td>
<td align="left">ISR</td>
<td align="right">376</td>
<td align="left">Israel</td>
<td align="right">2171</td>
</tr>
<tr class="even">
<td align="left">ITA</td>
<td align="left">IT</td>
<td align="left">IT</td>
<td align="left">ITA</td>
<td align="right">380</td>
<td align="left">Italy</td>
<td align="right">29411</td>
</tr>
<tr class="odd">
<td align="left">CIV</td>
<td align="left">IV</td>
<td align="left">CI</td>
<td align="left">CIV</td>
<td align="right">384</td>
<td align="left">Cote d'Ivoire</td>
<td align="right">31800</td>
</tr>
<tr class="even">
<td align="left">IRQ</td>
<td align="left">IZ</td>
<td align="left">IQ</td>
<td align="left">IRQ</td>
<td align="right">368</td>
<td align="left">Iraq</td>
<td align="right">43737</td>
</tr>
<tr class="odd">
<td align="left">JPN</td>
<td align="left">JA</td>
<td align="left">JP</td>
<td align="left">JPN</td>
<td align="right">392</td>
<td align="left">Japan</td>
<td align="right">36450</td>
</tr>
<tr class="even">
<td align="left">JAM</td>
<td align="left">JM</td>
<td align="left">JM</td>
<td align="left">JAM</td>
<td align="right">388</td>
<td align="left">Jamaica</td>
<td align="right">1083</td>
</tr>
<tr class="odd">
<td align="left">JOR</td>
<td align="left">JO</td>
<td align="left">JO</td>
<td align="left">JOR</td>
<td align="right">400</td>
<td align="left">Jordan</td>
<td align="right">8824</td>
</tr>
<tr class="even">
<td align="left">KEN</td>
<td align="left">KE</td>
<td align="left">KE</td>
<td align="left">KEN</td>
<td align="right">404</td>
<td align="left">Kenya</td>
<td align="right">56914</td>
</tr>
<tr class="odd">
<td align="left">KGZ</td>
<td align="left">KG</td>
<td align="left">KG</td>
<td align="left">KGZ</td>
<td align="right">417</td>
<td align="left">Kyrgyzstan</td>
<td align="right">19180</td>
</tr>
<tr class="even">
<td align="left">PRK</td>
<td align="left">KN</td>
<td align="left">KP</td>
<td align="left">PRK</td>
<td align="right">408</td>
<td align="left">Korea, Democratic People's Republic of</td>
<td align="right">12041</td>
</tr>
<tr class="odd">
<td align="left">KIR</td>
<td align="left">KR</td>
<td align="left">KI</td>
<td align="left">KIR</td>
<td align="right">296</td>
<td align="left">Kiribati</td>
<td align="right">73</td>
</tr>
<tr class="even">
<td align="left">KOR</td>
<td align="left">KS</td>
<td align="left">KR</td>
<td align="left">KOR</td>
<td align="right">410</td>
<td align="left">Korea, Republic of</td>
<td align="right">9873</td>
</tr>
<tr class="odd">
<td align="left">KWT</td>
<td align="left">KU</td>
<td align="left">KW</td>
<td align="left">KWT</td>
<td align="right">414</td>
<td align="left">Kuwait</td>
<td align="right">1782</td>
</tr>
<tr class="even">
<td align="left">KAZ</td>
<td align="left">KZ</td>
<td align="left">KZ</td>
<td align="left">KAZ</td>
<td align="right">398</td>
<td align="left">Kazakhstan</td>
<td align="right">269970</td>
</tr>
<tr class="odd">
<td align="left">LAO</td>
<td align="left">LA</td>
<td align="left">LA</td>
<td align="left">LAO</td>
<td align="right">418</td>
<td align="left">Lao People's Democratic Republic</td>
<td align="right">23080</td>
</tr>
<tr class="even">
<td align="left">LBN</td>
<td align="left">LE</td>
<td align="left">LB</td>
<td align="left">LBN</td>
<td align="right">422</td>
<td align="left">Lebanon</td>
<td align="right">1023</td>
</tr>
<tr class="odd">
<td align="left">LVA</td>
<td align="left">LG</td>
<td align="left">LV</td>
<td align="left">LVA</td>
<td align="right">428</td>
<td align="left">Latvia</td>
<td align="right">6205</td>
</tr>
<tr class="even">
<td align="left">BLR</td>
<td align="left">BO</td>
<td align="left">BY</td>
<td align="left">BLR</td>
<td align="right">112</td>
<td align="left">Belarus</td>
<td align="right">20748</td>
</tr>
<tr class="odd">
<td align="left">LTU</td>
<td align="left">LH</td>
<td align="left">LT</td>
<td align="left">LTU</td>
<td align="right">440</td>
<td align="left">Lithuania</td>
<td align="right">6268</td>
</tr>
<tr class="even">
<td align="left">LBR</td>
<td align="left">LI</td>
<td align="left">LR</td>
<td align="left">LBR</td>
<td align="right">430</td>
<td align="left">Liberia</td>
<td align="right">9632</td>
</tr>
<tr class="odd">
<td align="left">SVK</td>
<td align="left">LO</td>
<td align="left">SK</td>
<td align="left">SVK</td>
<td align="right">703</td>
<td align="left">Slovakia</td>
<td align="right">4808</td>
</tr>
<tr class="even">
<td align="left">LIE</td>
<td align="left">LS</td>
<td align="left">LI</td>
<td align="left">LIE</td>
<td align="right">438</td>
<td align="left">Liechtenstein</td>
<td align="right">16</td>
</tr>
<tr class="odd">
<td align="left">LBY</td>
<td align="left">LY</td>
<td align="left">LY</td>
<td align="left">LBY</td>
<td align="right">434</td>
<td align="left">Libyan Arab Jamahiriya</td>
<td align="right">175954</td>
</tr>
<tr class="even">
<td align="left">MDG</td>
<td align="left">MA</td>
<td align="left">MG</td>
<td align="left">MDG</td>
<td align="right">450</td>
<td align="left">Madagascar</td>
<td align="right">58154</td>
</tr>
<tr class="odd">
<td align="left">MTQ</td>
<td align="left">MB</td>
<td align="left">MQ</td>
<td align="left">MTQ</td>
<td align="right">474</td>
<td align="left">Martinique</td>
<td align="right">106</td>
</tr>
<tr class="even">
<td align="left">MNG</td>
<td align="left">MG</td>
<td align="left">MN</td>
<td align="left">MNG</td>
<td align="right">496</td>
<td align="left">Mongolia</td>
<td align="right">156650</td>
</tr>
<tr class="odd">
<td align="left">MSR</td>
<td align="left">MH</td>
<td align="left">MS</td>
<td align="left">MSR</td>
<td align="right">500</td>
<td align="left">Montserrat</td>
<td align="right">10</td>
</tr>
<tr class="even">
<td align="left">MKD</td>
<td align="left">MK</td>
<td align="left">MK</td>
<td align="left">MKD</td>
<td align="right">807</td>
<td align="left">The former Yugoslav Republic of Macedonia</td>
<td align="right">2543</td>
</tr>
<tr class="odd">
<td align="left">MLI</td>
<td align="left">ML</td>
<td align="left">ML</td>
<td align="left">MLI</td>
<td align="right">466</td>
<td align="left">Mali</td>
<td align="right">122019</td>
</tr>
<tr class="even">
<td align="left">MAR</td>
<td align="left">MO</td>
<td align="left">MA</td>
<td align="left">MAR</td>
<td align="right">504</td>
<td align="left">Morocco</td>
<td align="right">44630</td>
</tr>
<tr class="odd">
<td align="left">MUS</td>
<td align="left">MP</td>
<td align="left">MU</td>
<td align="left">MUS</td>
<td align="right">480</td>
<td align="left">Mauritius</td>
<td align="right">203</td>
</tr>
<tr class="even">
<td align="left">MRT</td>
<td align="left">MR</td>
<td align="left">MR</td>
<td align="left">MRT</td>
<td align="right">478</td>
<td align="left">Mauritania</td>
<td align="right">102522</td>
</tr>
<tr class="odd">
<td align="left">MLT</td>
<td align="left">MT</td>
<td align="left">MT</td>
<td align="left">MLT</td>
<td align="right">470</td>
<td align="left">Malta</td>
<td align="right">32</td>
</tr>
<tr class="even">
<td align="left">OMN</td>
<td align="left">MU</td>
<td align="left">OM</td>
<td align="left">OMN</td>
<td align="right">512</td>
<td align="left">Oman</td>
<td align="right">30950</td>
</tr>
<tr class="odd">
<td align="left">MDV</td>
<td align="left">MV</td>
<td align="left">MV</td>
<td align="left">MDV</td>
<td align="right">462</td>
<td align="left">Maldives</td>
<td align="right">30</td>
</tr>
<tr class="even">
<td align="left">MEX</td>
<td align="left">MX</td>
<td align="left">MX</td>
<td align="left">MEX</td>
<td align="right">484</td>
<td align="left">Mexico</td>
<td align="right">190869</td>
</tr>
<tr class="odd">
<td align="left">MYS</td>
<td align="left">MY</td>
<td align="left">MY</td>
<td align="left">MYS</td>
<td align="right">458</td>
<td align="left">Malaysia</td>
<td align="right">32855</td>
</tr>
<tr class="even">
<td align="left">MOZ</td>
<td align="left">MZ</td>
<td align="left">MZ</td>
<td align="left">MOZ</td>
<td align="right">508</td>
<td align="left">Mozambique</td>
<td align="right">78409</td>
</tr>
<tr class="odd">
<td align="left">MWI</td>
<td align="left">MI</td>
<td align="left">MW</td>
<td align="left">MWI</td>
<td align="right">454</td>
<td align="left">Malawi</td>
<td align="right">9408</td>
</tr>
<tr class="even">
<td align="left">NCL</td>
<td align="left">NC</td>
<td align="left">NC</td>
<td align="left">NCL</td>
<td align="right">540</td>
<td align="left">New Caledonia</td>
<td align="right">1828</td>
</tr>
<tr class="odd">
<td align="left">NIU</td>
<td align="left">NE</td>
<td align="left">NU</td>
<td align="left">NIU</td>
<td align="right">570</td>
<td align="left">Niue</td>
<td align="right">26</td>
</tr>
<tr class="even">
<td align="left">NER</td>
<td align="left">NG</td>
<td align="left">NE</td>
<td align="left">NER</td>
<td align="right">562</td>
<td align="left">Niger</td>
<td align="right">126670</td>
</tr>
<tr class="odd">
<td align="left">ABW</td>
<td align="left">AA</td>
<td align="left">AW</td>
<td align="left">ABW</td>
<td align="right">533</td>
<td align="left">Aruba</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">AIA</td>
<td align="left">AV</td>
<td align="left">AI</td>
<td align="left">AIA</td>
<td align="right">660</td>
<td align="left">Anguilla</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">BEL</td>
<td align="left">BE</td>
<td align="left">BE</td>
<td align="left">BEL</td>
<td align="right">56</td>
<td align="left">Belgium</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">HKG</td>
<td align="left">HK</td>
<td align="left">HK</td>
<td align="left">HKG</td>
<td align="right">344</td>
<td align="left">Hong Kong</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">MNP</td>
<td align="left">CQ</td>
<td align="left">MP</td>
<td align="left">MNP</td>
<td align="right">580</td>
<td align="left">Northern Mariana Islands</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">FRO</td>
<td align="left">FO</td>
<td align="left">FO</td>
<td align="left">FRO</td>
<td align="right">234</td>
<td align="left">Faroe Islands</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">AND</td>
<td align="left">AN</td>
<td align="left">AD</td>
<td align="left">AND</td>
<td align="right">20</td>
<td align="left">Andorra</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">GIB</td>
<td align="left">GI</td>
<td align="left">GI</td>
<td align="left">GIB</td>
<td align="right">292</td>
<td align="left">Gibraltar</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">IMN</td>
<td align="left">IM</td>
<td align="left">IM</td>
<td align="left">IMN</td>
<td align="right">833</td>
<td align="left">Isle of Man</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">LUX</td>
<td align="left">LU</td>
<td align="left">LU</td>
<td align="left">LUX</td>
<td align="right">442</td>
<td align="left">Luxembourg</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">MAC</td>
<td align="left">MC</td>
<td align="left">MO</td>
<td align="left">MAC</td>
<td align="right">446</td>
<td align="left">Macau</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">MCO</td>
<td align="left">MN</td>
<td align="left">MC</td>
<td align="left">MCO</td>
<td align="right">492</td>
<td align="left">Monaco</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">PSE</td>
<td align="left"></td>
<td align="left">PS</td>
<td align="left">PSE</td>
<td align="right">275</td>
<td align="left">Palestine</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">MNE</td>
<td align="left">MJ</td>
<td align="left">ME</td>
<td align="left">MNE</td>
<td align="right">499</td>
<td align="left">Montenegro</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">MYT</td>
<td align="left">MF</td>
<td align="left">YT</td>
<td align="left">MYT</td>
<td align="right">175</td>
<td align="left">Mayotte</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">ALA</td>
<td align="left"></td>
<td align="left">AX</td>
<td align="left">ALA</td>
<td align="right">248</td>
<td align="left">Aaland Islands</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">NFK</td>
<td align="left">NF</td>
<td align="left">NF</td>
<td align="left">NFK</td>
<td align="right">574</td>
<td align="left">Norfolk Island</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">CCK</td>
<td align="left">CK</td>
<td align="left">CC</td>
<td align="left">CCK</td>
<td align="right">166</td>
<td align="left">Cocos (Keeling) Islands</td>
<td align="right">1</td>
</tr>
<tr class="odd">
<td align="left">ATA</td>
<td align="left">AY</td>
<td align="left">AQ</td>
<td align="left">ATA</td>
<td align="right">10</td>
<td align="left">Antarctica</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">BVT</td>
<td align="left">BV</td>
<td align="left">BV</td>
<td align="left">BVT</td>
<td align="right">74</td>
<td align="left">Bouvet Island</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">ATF</td>
<td align="left">FS</td>
<td align="left">TF</td>
<td align="left">ATF</td>
<td align="right">260</td>
<td align="left">French Southern and Antarctic Lands</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">HMD</td>
<td align="left">HM</td>
<td align="left">HM</td>
<td align="left">HMD</td>
<td align="right">334</td>
<td align="left">Heard Island and McDonald Islands</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">IOT</td>
<td align="left">IO</td>
<td align="left">IO</td>
<td align="left">IOT</td>
<td align="right">86</td>
<td align="left">British Indian Ocean Territory</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">CXR</td>
<td align="left">KT</td>
<td align="left">CX</td>
<td align="left">CXR</td>
<td align="right">162</td>
<td align="left">Christmas Island</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">UMI</td>
<td align="left"></td>
<td align="left">UM</td>
<td align="left">UMI</td>
<td align="right">581</td>
<td align="left">United States Minor Outlying Islands</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">VUT</td>
<td align="left">NH</td>
<td align="left">VU</td>
<td align="left">VUT</td>
<td align="right">548</td>
<td align="left">Vanuatu</td>
<td align="right">1219</td>
</tr>
<tr class="odd">
<td align="left">NGA</td>
<td align="left">NI</td>
<td align="left">NG</td>
<td align="left">NGA</td>
<td align="right">566</td>
<td align="left">Nigeria</td>
<td align="right">91077</td>
</tr>
<tr class="even">
<td align="left">NLD</td>
<td align="left">NL</td>
<td align="left">NL</td>
<td align="left">NLD</td>
<td align="right">528</td>
<td align="left">Netherlands</td>
<td align="right">3388</td>
</tr>
<tr class="odd">
<td align="left">NOR</td>
<td align="left">NO</td>
<td align="left">NO</td>
<td align="left">NOR</td>
<td align="right">578</td>
<td align="left">Norway</td>
<td align="right">30625</td>
</tr>
<tr class="even">
<td align="left">NPL</td>
<td align="left">NP</td>
<td align="left">NP</td>
<td align="left">NPL</td>
<td align="right">524</td>
<td align="left">Nepal</td>
<td align="right">14300</td>
</tr>
<tr class="odd">
<td align="left">NRU</td>
<td align="left">NR</td>
<td align="left">NR</td>
<td align="left">NRU</td>
<td align="right">520</td>
<td align="left">Nauru</td>
<td align="right">2</td>
</tr>
<tr class="even">
<td align="left">SUR</td>
<td align="left">NS</td>
<td align="left">SR</td>
<td align="left">SUR</td>
<td align="right">740</td>
<td align="left">Suriname</td>
<td align="right">15600</td>
</tr>
<tr class="odd">
<td align="left">NIC</td>
<td align="left">NU</td>
<td align="left">NI</td>
<td align="left">NIC</td>
<td align="right">558</td>
<td align="left">Nicaragua</td>
<td align="right">12140</td>
</tr>
<tr class="even">
<td align="left">NZL</td>
<td align="left">NZ</td>
<td align="left">NZ</td>
<td align="left">NZL</td>
<td align="right">554</td>
<td align="left">New Zealand</td>
<td align="right">26799</td>
</tr>
<tr class="odd">
<td align="left">PRY</td>
<td align="left">PA</td>
<td align="left">PY</td>
<td align="left">PRY</td>
<td align="right">600</td>
<td align="left">Paraguay</td>
<td align="right">39730</td>
</tr>
<tr class="even">
<td align="left">PER</td>
<td align="left">PE</td>
<td align="left">PE</td>
<td align="left">PER</td>
<td align="right">604</td>
<td align="left">Peru</td>
<td align="right">128000</td>
</tr>
<tr class="odd">
<td align="left">PAK</td>
<td align="left">PK</td>
<td align="left">PK</td>
<td align="left">PAK</td>
<td align="right">586</td>
<td align="left">Pakistan</td>
<td align="right">77088</td>
</tr>
<tr class="even">
<td align="left">POL</td>
<td align="left">PL</td>
<td align="left">PL</td>
<td align="left">POL</td>
<td align="right">616</td>
<td align="left">Poland</td>
<td align="right">30629</td>
</tr>
<tr class="odd">
<td align="left">PAN</td>
<td align="left">PM</td>
<td align="left">PA</td>
<td align="left">PAN</td>
<td align="right">591</td>
<td align="left">Panama</td>
<td align="right">7443</td>
</tr>
<tr class="even">
<td align="left">PRT</td>
<td align="left">PO</td>
<td align="left">PT</td>
<td align="left">PRT</td>
<td align="right">620</td>
<td align="left">Portugal</td>
<td align="right">9150</td>
</tr>
<tr class="odd">
<td align="left">PNG</td>
<td align="left">PP</td>
<td align="left">PG</td>
<td align="left">PNG</td>
<td align="right">598</td>
<td align="left">Papua New Guinea</td>
<td align="right">45286</td>
</tr>
<tr class="even">
<td align="left">GNB</td>
<td align="left">PU</td>
<td align="left">GW</td>
<td align="left">GNB</td>
<td align="right">624</td>
<td align="left">Guinea-Bissau</td>
<td align="right">2812</td>
</tr>
<tr class="odd">
<td align="left">QAT</td>
<td align="left">QA</td>
<td align="left">QA</td>
<td align="left">QAT</td>
<td align="right">634</td>
<td align="left">Qatar</td>
<td align="right">1100</td>
</tr>
<tr class="even">
<td align="left">REU</td>
<td align="left">RE</td>
<td align="left">RE</td>
<td align="left">REU</td>
<td align="right">638</td>
<td align="left">Reunion</td>
<td align="right">250</td>
</tr>
<tr class="odd">
<td align="left">ROU</td>
<td align="left">RO</td>
<td align="left">RO</td>
<td align="left">ROU</td>
<td align="right">642</td>
<td align="left">Romania</td>
<td align="right">22987</td>
</tr>
<tr class="even">
<td align="left">MDA</td>
<td align="left">MD</td>
<td align="left">MD</td>
<td align="left">MDA</td>
<td align="right">498</td>
<td align="left">Republic of Moldova</td>
<td align="right">3288</td>
</tr>
<tr class="odd">
<td align="left">PHL</td>
<td align="left">RP</td>
<td align="left">PH</td>
<td align="left">PHL</td>
<td align="right">608</td>
<td align="left">Philippines</td>
<td align="right">29817</td>
</tr>
<tr class="even">
<td align="left">PRI</td>
<td align="left">RQ</td>
<td align="left">PR</td>
<td align="left">PRI</td>
<td align="right">630</td>
<td align="left">Puerto Rico</td>
<td align="right">887</td>
</tr>
<tr class="odd">
<td align="left">RUS</td>
<td align="left">RS</td>
<td align="left">RU</td>
<td align="left">RUS</td>
<td align="right">643</td>
<td align="left">Russia</td>
<td align="right">1638094</td>
</tr>
<tr class="even">
<td align="left">RWA</td>
<td align="left">RW</td>
<td align="left">RW</td>
<td align="left">RWA</td>
<td align="right">646</td>
<td align="left">Rwanda</td>
<td align="right">2467</td>
</tr>
<tr class="odd">
<td align="left">SAU</td>
<td align="left">SA</td>
<td align="left">SA</td>
<td align="left">SAU</td>
<td align="right">682</td>
<td align="left">Saudi Arabia</td>
<td align="right">214969</td>
</tr>
<tr class="even">
<td align="left">KNA</td>
<td align="left">SC</td>
<td align="left">KN</td>
<td align="left">KNA</td>
<td align="right">659</td>
<td align="left">Saint Kitts and Nevis</td>
<td align="right">36</td>
</tr>
<tr class="odd">
<td align="left">SYC</td>
<td align="left">SE</td>
<td align="left">SC</td>
<td align="left">SYC</td>
<td align="right">690</td>
<td align="left">Seychelles</td>
<td align="right">46</td>
</tr>
<tr class="even">
<td align="left">ZAF</td>
<td align="left">SF</td>
<td align="left">ZA</td>
<td align="left">ZAF</td>
<td align="right">710</td>
<td align="left">South Africa</td>
<td align="right">121447</td>
</tr>
<tr class="odd">
<td align="left">LSO</td>
<td align="left">LT</td>
<td align="left">LS</td>
<td align="left">LSO</td>
<td align="right">426</td>
<td align="left">Lesotho</td>
<td align="right">3035</td>
</tr>
<tr class="even">
<td align="left">BWA</td>
<td align="left">BC</td>
<td align="left">BW</td>
<td align="left">BWA</td>
<td align="right">72</td>
<td align="left">Botswana</td>
<td align="right">56673</td>
</tr>
<tr class="odd">
<td align="left">SEN</td>
<td align="left">SG</td>
<td align="left">SN</td>
<td align="left">SEN</td>
<td align="right">686</td>
<td align="left">Senegal</td>
<td align="right">19253</td>
</tr>
<tr class="even">
<td align="left">SVN</td>
<td align="left">SI</td>
<td align="left">SI</td>
<td align="left">SVN</td>
<td align="right">705</td>
<td align="left">Slovenia</td>
<td align="right">2014</td>
</tr>
<tr class="odd">
<td align="left">SLE</td>
<td align="left">SL</td>
<td align="left">SL</td>
<td align="left">SLE</td>
<td align="right">694</td>
<td align="left">Sierra Leone</td>
<td align="right">7162</td>
</tr>
<tr class="even">
<td align="left">SGP</td>
<td align="left">SN</td>
<td align="left">SG</td>
<td align="left">SGP</td>
<td align="right">702</td>
<td align="left">Singapore</td>
<td align="right">67</td>
</tr>
<tr class="odd">
<td align="left">SOM</td>
<td align="left">SO</td>
<td align="left">SO</td>
<td align="left">SOM</td>
<td align="right">706</td>
<td align="left">Somalia</td>
<td align="right">62734</td>
</tr>
<tr class="even">
<td align="left">ESP</td>
<td align="left">SP</td>
<td align="left">ES</td>
<td align="left">ESP</td>
<td align="right">724</td>
<td align="left">Spain</td>
<td align="right">49904</td>
</tr>
<tr class="odd">
<td align="left">LCA</td>
<td align="left">ST</td>
<td align="left">LC</td>
<td align="left">LCA</td>
<td align="right">662</td>
<td align="left">Saint Lucia</td>
<td align="right">61</td>
</tr>
<tr class="even">
<td align="left">SDN</td>
<td align="left">SU</td>
<td align="left">SD</td>
<td align="left">SDN</td>
<td align="right">736</td>
<td align="left">Sudan</td>
<td align="right">237600</td>
</tr>
<tr class="odd">
<td align="left">SWE</td>
<td align="left">SW</td>
<td align="left">SE</td>
<td align="left">SWE</td>
<td align="right">752</td>
<td align="left">Sweden</td>
<td align="right">41033</td>
</tr>
<tr class="even">
<td align="left">SYR</td>
<td align="left">SY</td>
<td align="left">SY</td>
<td align="left">SYR</td>
<td align="right">760</td>
<td align="left">Syrian Arab Republic</td>
<td align="right">18378</td>
</tr>
<tr class="odd">
<td align="left">CHE</td>
<td align="left">SZ</td>
<td align="left">CH</td>
<td align="left">CHE</td>
<td align="right">756</td>
<td align="left">Switzerland</td>
<td align="right">4000</td>
</tr>
<tr class="even">
<td align="left">TTO</td>
<td align="left">TD</td>
<td align="left">TT</td>
<td align="left">TTO</td>
<td align="right">780</td>
<td align="left">Trinidad and Tobago</td>
<td align="right">513</td>
</tr>
<tr class="odd">
<td align="left">THA</td>
<td align="left">TH</td>
<td align="left">TH</td>
<td align="left">THA</td>
<td align="right">764</td>
<td align="left">Thailand</td>
<td align="right">51089</td>
</tr>
<tr class="even">
<td align="left">TJK</td>
<td align="left">TI</td>
<td align="left">TJ</td>
<td align="left">TJK</td>
<td align="right">762</td>
<td align="left">Tajikistan</td>
<td align="right">13996</td>
</tr>
<tr class="odd">
<td align="left">TKL</td>
<td align="left">TL</td>
<td align="left">TK</td>
<td align="left">TKL</td>
<td align="right">772</td>
<td align="left">Tokelau</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="left">TON</td>
<td align="left">TN</td>
<td align="left">TO</td>
<td align="left">TON</td>
<td align="right">776</td>
<td align="left">Tonga</td>
<td align="right">72</td>
</tr>
<tr class="odd">
<td align="left">TGO</td>
<td align="left">TO</td>
<td align="left">TG</td>
<td align="left">TGO</td>
<td align="right">768</td>
<td align="left">Togo</td>
<td align="right">5439</td>
</tr>
<tr class="even">
<td align="left">STP</td>
<td align="left">TP</td>
<td align="left">ST</td>
<td align="left">STP</td>
<td align="right">678</td>
<td align="left">Sao Tome and Principe</td>
<td align="right">96</td>
</tr>
<tr class="odd">
<td align="left">TUN</td>
<td align="left">TS</td>
<td align="left">TN</td>
<td align="left">TUN</td>
<td align="right">788</td>
<td align="left">Tunisia</td>
<td align="right">15536</td>
</tr>
<tr class="even">
<td align="left">TUR</td>
<td align="left">TU</td>
<td align="left">TR</td>
<td align="left">TUR</td>
<td align="right">792</td>
<td align="left">Turkey</td>
<td align="right">76963</td>
</tr>
<tr class="odd">
<td align="left">TUV</td>
<td align="left">TV</td>
<td align="left">TV</td>
<td align="left">TUV</td>
<td align="right">798</td>
<td align="left">Tuvalu</td>
<td align="right">3</td>
</tr>
<tr class="even">
<td align="left">TKM</td>
<td align="left">TX</td>
<td align="left">TM</td>
<td align="left">TKM</td>
<td align="right">795</td>
<td align="left">Turkmenistan</td>
<td align="right">46993</td>
</tr>
<tr class="odd">
<td align="left">TZA</td>
<td align="left">TZ</td>
<td align="left">TZ</td>
<td align="left">TZA</td>
<td align="right">834</td>
<td align="left">United Republic of Tanzania</td>
<td align="right">88359</td>
</tr>
<tr class="even">
<td align="left">UGA</td>
<td align="left">UG</td>
<td align="left">UG</td>
<td align="left">UGA</td>
<td align="right">800</td>
<td align="left">Uganda</td>
<td align="right">19710</td>
</tr>
<tr class="odd">
<td align="left">GBR</td>
<td align="left">UK</td>
<td align="left">GB</td>
<td align="left">GBR</td>
<td align="right">826</td>
<td align="left">United Kingdom</td>
<td align="right">24193</td>
</tr>
<tr class="even">
<td align="left">UKR</td>
<td align="left">UP</td>
<td align="left">UA</td>
<td align="left">UKR</td>
<td align="right">804</td>
<td align="left">Ukraine</td>
<td align="right">57935</td>
</tr>
<tr class="odd">
<td align="left">USA</td>
<td align="left">US</td>
<td align="left">US</td>
<td align="left">USA</td>
<td align="right">840</td>
<td align="left">United States</td>
<td align="right">915896</td>
</tr>
<tr class="even">
<td align="left">BFA</td>
<td align="left">UV</td>
<td align="left">BF</td>
<td align="left">BFA</td>
<td align="right">854</td>
<td align="left">Burkina Faso</td>
<td align="right">27360</td>
</tr>
<tr class="odd">
<td align="left">URY</td>
<td align="left">UY</td>
<td align="left">UY</td>
<td align="left">URY</td>
<td align="right">858</td>
<td align="left">Uruguay</td>
<td align="right">17502</td>
</tr>
<tr class="even">
<td align="left">UZB</td>
<td align="left">UZ</td>
<td align="left">UZ</td>
<td align="left">UZB</td>
<td align="right">860</td>
<td align="left">Uzbekistan</td>
<td align="right">42540</td>
</tr>
<tr class="odd">
<td align="left">VCT</td>
<td align="left">VC</td>
<td align="left">VC</td>
<td align="left">VCT</td>
<td align="right">670</td>
<td align="left">Saint Vincent and the Grenadines</td>
<td align="right">39</td>
</tr>
<tr class="even">
<td align="left">VEN</td>
<td align="left">VE</td>
<td align="left">VE</td>
<td align="left">VEN</td>
<td align="right">862</td>
<td align="left">Venezuela</td>
<td align="right">88205</td>
</tr>
<tr class="odd">
<td align="left">VGB</td>
<td align="left">VI</td>
<td align="left">VG</td>
<td align="left">VGB</td>
<td align="right">92</td>
<td align="left">British Virgin Islands</td>
<td align="right">15</td>
</tr>
<tr class="even">
<td align="left">VNM</td>
<td align="left">VM</td>
<td align="left">VN</td>
<td align="left">VNM</td>
<td align="right">704</td>
<td align="left">Viet Nam</td>
<td align="right">32549</td>
</tr>
<tr class="odd">
<td align="left">VIR</td>
<td align="left">VQ</td>
<td align="left">VI</td>
<td align="left">VIR</td>
<td align="right">850</td>
<td align="left">United States Virgin Islands</td>
<td align="right">35</td>
</tr>
<tr class="even">
<td align="left">NAM</td>
<td align="left">WA</td>
<td align="left">NA</td>
<td align="left">NAM</td>
<td align="right">516</td>
<td align="left">Namibia</td>
<td align="right">82329</td>
</tr>
<tr class="odd">
<td align="left">WLF</td>
<td align="left">WF</td>
<td align="left">WF</td>
<td align="left">WLF</td>
<td align="right">876</td>
<td align="left">Wallis and Futuna Islands</td>
<td align="right">14</td>
</tr>
<tr class="even">
<td align="left">WSM</td>
<td align="left">WS</td>
<td align="left">WS</td>
<td align="left">WSM</td>
<td align="right">882</td>
<td align="left">Samoa</td>
<td align="right">283</td>
</tr>
<tr class="odd">
<td align="left">SWZ</td>
<td align="left">WZ</td>
<td align="left">SZ</td>
<td align="left">SWZ</td>
<td align="right">748</td>
<td align="left">Swaziland</td>
<td align="right">1720</td>
</tr>
<tr class="even">
<td align="left">YEM</td>
<td align="left">YM</td>
<td align="left">YE</td>
<td align="left">YEM</td>
<td align="right">887</td>
<td align="left">Yemen</td>
<td align="right">52797</td>
</tr>
<tr class="odd">
<td align="left">ZMB</td>
<td align="left">ZA</td>
<td align="left">ZM</td>
<td align="left">ZMB</td>
<td align="right">894</td>
<td align="left">Zambia</td>
<td align="right">74339</td>
</tr>
<tr class="even">
<td align="left">ZWE</td>
<td align="left">ZI</td>
<td align="left">ZW</td>
<td align="left">ZWE</td>
<td align="right">716</td>
<td align="left">Zimbabwe</td>
<td align="right">38685</td>
</tr>
<tr class="odd">
<td align="left">IDN</td>
<td align="left">ID</td>
<td align="left">ID</td>
<td align="left">IDN</td>
<td align="right">360</td>
<td align="left">Indonesia</td>
<td align="right">181157</td>
</tr>
<tr class="even">
<td align="left">GLP</td>
<td align="left">GP</td>
<td align="left">GP</td>
<td align="left">GLP</td>
<td align="right">312</td>
<td align="left">Guadeloupe</td>
<td align="right">169</td>
</tr>
<tr class="odd">
<td align="left">ANT</td>
<td align="left">NT</td>
<td align="left">AN</td>
<td align="left">ANT</td>
<td align="right">530</td>
<td align="left">Netherlands Antilles</td>
<td align="right">80</td>
</tr>
<tr class="even">
<td align="left">ARE</td>
<td align="left">AE</td>
<td align="left">AE</td>
<td align="left">ARE</td>
<td align="right">784</td>
<td align="left">Untied Arab Emirates</td>
<td align="right">8360</td>
</tr>
<tr class="odd">
<td align="left">TLS</td>
<td align="left">TT</td>
<td align="left">TL</td>
<td align="left">TLS</td>
<td align="right">626</td>
<td align="left">Timor-Leste</td>
<td align="right">1487</td>
</tr>
<tr class="even">
<td align="left">PCN</td>
<td align="left">PC</td>
<td align="left">PN</td>
<td align="left">PCN</td>
<td align="right">612</td>
<td align="left">Pitcairn Islands</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">PLW</td>
<td align="left">PS</td>
<td align="left">PW</td>
<td align="left">PLW</td>
<td align="right">585</td>
<td align="left">Palau</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">MHL</td>
<td align="left">RM</td>
<td align="left">MH</td>
<td align="left">MHL</td>
<td align="right">584</td>
<td align="left">Marshall Islands</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">SPM</td>
<td align="left">SB</td>
<td align="left">PM</td>
<td align="left">SPM</td>
<td align="right">666</td>
<td align="left">Saint Pierre and Miquelon</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">SHN</td>
<td align="left">SH</td>
<td align="left">SH</td>
<td align="left">SHN</td>
<td align="right">654</td>
<td align="left">Saint Helena</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">SMR</td>
<td align="left">SM</td>
<td align="left">SM</td>
<td align="left">SMR</td>
<td align="right">674</td>
<td align="left">San Marino</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">TCA</td>
<td align="left">TK</td>
<td align="left">TC</td>
<td align="left">TCA</td>
<td align="right">796</td>
<td align="left">Turks and Caicos Islands</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">ESH</td>
<td align="left">WI</td>
<td align="left">EH</td>
<td align="left">ESH</td>
<td align="right">732</td>
<td align="left">Western Sahara</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">SRB</td>
<td align="left">RB</td>
<td align="left">RS</td>
<td align="left">SRB</td>
<td align="right">688</td>
<td align="left">Serbia</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">VAT</td>
<td align="left">VT</td>
<td align="left">VA</td>
<td align="left">VAT</td>
<td align="right">336</td>
<td align="left">Holy See (Vatican City)</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">SJM</td>
<td align="left">SV</td>
<td align="left">SJ</td>
<td align="left">SJM</td>
<td align="right">744</td>
<td align="left">Svalbard</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">MAF</td>
<td align="left">RN</td>
<td align="left">MF</td>
<td align="left">MAF</td>
<td align="right">663</td>
<td align="left">Saint Martin</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">BLM</td>
<td align="left">TB</td>
<td align="left">BL</td>
<td align="left">BLM</td>
<td align="right">652</td>
<td align="left">Saint Barthelemy</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">GGY</td>
<td align="left">GK</td>
<td align="left">GG</td>
<td align="left">GGY</td>
<td align="right">831</td>
<td align="left">Guernsey</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">JEY</td>
<td align="left">JE</td>
<td align="left">JE</td>
<td align="left">JEY</td>
<td align="right">832</td>
<td align="left">Jersey</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">SGS</td>
<td align="left">SX</td>
<td align="left">GS</td>
<td align="left">SGS</td>
<td align="right">239</td>
<td align="left">South Georgia South Sandwich Islands</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">TWN</td>
<td align="left">TW</td>
<td align="left">TW</td>
<td align="left">TWN</td>
<td align="right">158</td>
<td align="left">Taiwan</td>
<td align="right">0</td>
</tr>
</tbody>
</table>

The structure of the data set
-----------------------------

-   with head you get only the first entries

<!-- -->

    head(wrld_simpl@data$NAME)

    ## [1] Antigua and Barbuda Algeria             Azerbaijan         
    ## [4] Albania             Armenia             Angola             
    ## 246 Levels: Aaland Islands Afghanistan Albania Algeria ... Zimbabwe

A logical request
-----------------

    ind_SA <- wrld_simpl@data$NAME =="South Africa"
    head(ind_SA)

    ## [1] FALSE FALSE FALSE FALSE FALSE FALSE

    table(ind_SA)

    ## ind_SA
    ## FALSE  TRUE 
    ##   245     1

A map for South Africa
----------------------

-   plot only one country

<!-- -->

    SouthAfrica <- wrld_simpl[ind_SA,]
    plot(SouthAfrica)

![](B_maptools_files/figure-markdown_strict/unnamed-chunk-8-1.png)

Select more than one country
----------------------------

    EuropeList <- c('Germany', 'France')
    my_map <- wrld_simpl[wrld_simpl$NAME %in% EuropeList, ]
    plot(my_map)

![](B_maptools_files/figure-markdown_strict/unnamed-chunk-9-1.png)

More color
----------

    my_map@data$color <- c("blue","green")
    plot(my_map,col=my_map@data$color)

![](B_maptools_files/figure-markdown_strict/unnamed-chunk-10-1.png)

More color for the world
------------------------

    plot(wrld_simpl, bg='azure2', col='khaki', border='#AAAAAA')

![](B_maptools_files/figure-markdown_strict/unnamed-chunk-11-1.png)
