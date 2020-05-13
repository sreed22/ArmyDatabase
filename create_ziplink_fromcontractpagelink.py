import numpy as np
import pandas as pd
import requests
from datetime import date
import os
import glob

#This script recreates the contract pdf zip link from the contract page url based on elements that both links have in common.

#read the csv file containing the urls of the contract pages
sam=pd.read_csv('sam2.csv')

#convert columns to lists
sam["Link"]=sam["Link"].astype(str)
linkstoconvert=sam["Link"].tolist()
contracts=sam["Contract"].tolist()
empty_list =[]
for item in linkstoconvert:
    try:
        splitvalues=item.split("/")
        pdflink=splitvalues[0]+"//"+splitvalues[2]+"/api/prod/opps/v3/opportunities/"+splitvalues[4]+"/resources/download/zip?api_key=null&token="
        empty_list.append([pdflink])
        print(empty_list)
    except:
        pass
pdflinks=pd.DataFrame(empty_list)
pdflinks=sam.join(pdflinks)
pdflinks= pdflinks.rename(columns={0:'Zip Link'})

#The new contract document zip links are provided into a new column called Zip Link and saved to the new file specified below.
pdflinks.to_csv('pdflinkstest.csv')



