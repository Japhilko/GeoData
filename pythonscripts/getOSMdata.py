# -*- coding: utf-8 -*-
"""
Created on Fri Mar 25 15:15:57 2016

@author: ntuser
"""

# https://www.e-education.psu.edu/geog585/node/739

# https://ep2013.europython.eu/media/conference/slides/making-use-of-openstreetmap-data-with-python.pdf

# http://wiki.openstreetmap.org/wiki/Osmapi

from osmapi import OsmApi

MyApi = OsmApi()

print MyApi.NodeGet(123)


#-----------------------------------------------------#

# https://vimeo.com/101220572
# http://balzer82.github.io/OSM2Pandas/

# Get a bounding box
# http://boundingbox.klokantech.com/
# http://nbviewer.jupyter.org/github/balzer82/OSM2Pandas/blob/master/OSM2Pandas-Kreuzungen.ipynb

import pandas as pd

import requests

import json

bbox = [13.521945,50.919085,13.976063,51.18772]

# Links unten
minLat = bbox[1]
minLon = bbox[0]

# Rechts oben
maxLat = bbox[3]
maxLon = bbox[2]
    
    tags = ['primary','secondary','secondary_link','tertiary','tertiary_link','living_street','residential']
    objects = ['way'] # like way, node, relation
    
    compactOverpassQLstring = '[out:json][timeout:60];('
    for tag in tags:
        for obj in objects:
            compactOverpassQLstring += '%s["highway"="%s"](%s,%s,%s,%s);' % (obj, tag, minLat, minLon, maxLat, maxLon)
    compactOverpassQLstring += ');out body;>;out skel qt;' 



osmrequest = {'data': compactOverpassQLstring}
osmurl = 'http://overpass-api.de/api/interpreter'

# Ask the API
osm = requests.get(osmurl, params=osmrequest)

osmdata = osm.json()
osmdata = osmdata['elements']
for dct in osmdata:
    if dct['type']=='way':
        for key, val in dct['tags'].iteritems():
            dct[key] = val
        del dct['tags']
    else:
        pass # nodes

osmdf = pd.DataFrame(osmdata)

osmdf.tail(5)
#------------------------------------------------------#
# Overpass API

import overpass
api = overpass.API()
response = api.Get('node["name"="Dresden"]')

# https://github.com/mvexel/overpass-api-python-wrapper


#------------------------------------------------------#
# http://gis.stackexchange.com/questions/76454/osm-extract-streets-from-osm-data-with-without-python
import ogr

ds = ogr.Open('map.osm')
layer = ds.GetLayer(1) # layer 1 for ways

nameList = []
for feature in layer:
    if feature.GetField("highway") != None: 
        name = feature.GetField("name")
        if name != None and name not in nameList: 
            nameList.append(name)

print nameList


#------------------------------------------------------#
# mapnik 

# https://gist.github.com/springmeyer/5651701


## Some Links

# http://forum.openstreetmap.org/viewtopic.php?id=7806

# https://github.com/brianw/osmgeocode

# http://wiki.openstreetmap.org/wiki/Nominatim

# https://www.youtube.com/watch?v=a0dT1Q2iPWA

# http://dataorigami.blogspot.de/2010/10/beta-release-how-to-render.html

# https://pythonhosted.org/osmium/intro.html