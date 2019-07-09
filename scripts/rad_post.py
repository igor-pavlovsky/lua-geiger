#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Script to get data from NodeMCU and save locally

@author: Igor Pavlovsky
"""

import cgi

data_inp = cgi.FieldStorage()

if "rad" in data_inp:
    
    # read data from NodeMCU
    rad_var = str(data_inp['rad'].value[:4])
        
    # save new data in a text file
    with open('path/to/file.txt', 'w') as f:
	    f.write(rad_var)    
        
    # print for debugging
    print ("Content-type: text/plain\n\n")
    print (rad_var)
else:
    print ("Content-type: text/plain\n\n")
    print ("Wrong query")