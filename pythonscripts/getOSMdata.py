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

import pandas as pd

import requests

import json



#------------------------------------------------------#
# mapnik 

# https://gist.github.com/springmeyer/5651701


## Some Links


# https://www.youtube.com/watch?v=a0dT1Q2iPWA