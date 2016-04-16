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


#------------------------------------------------------#
# Overpass API

import overpass
api = overpass.API()
response = api.Get('node["name"="Salt Lake City"]')

# https://github.com/mvexel/overpass-api-python-wrapper

#------------------------------------------------------#
# mapnik 

# https://gist.github.com/springmeyer/5651701


## Some Links

# http://forum.openstreetmap.org/viewtopic.php?id=7806

# https://github.com/brianw/osmgeocode

# http://wiki.openstreetmap.org/wiki/Nominatim

# https://www.youtube.com/watch?v=a0dT1Q2iPWA

# http://dataorigami.blogspot.de/2010/10/beta-release-how-to-render.html