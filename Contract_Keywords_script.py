#!/usr/bin/env python
# coding: utf-8

# This notebook requires that the following files are saved in the working directory:
# 1) 'pdflinkstest.csv' (file containing contracts and their url links)
# 2) 'DBSSystemListCat1_2.csv' (list of keywords provided by Army Team)

# This script will do the following:
# 1) Extract text from text pdfs for each contract in the database csv of url zip links
# 2) Clean the imported contract text
# 3) Import keywords provided in DBSSystemList
# 4) Create a list of keywords from the imported file
# 5) Scan the document for all keywords provided
# 6) Produce a frequency count of keywords present
# 7) Output a sorted list of keywords and their counts into a column called 'Top Keywords'
# 8) The output file containing the contents of pdflinktest.csv and 'Top Keywords' is named samfinal_specific_keywords.csv


#Import dependecies 
import pdfplumber
from flashtext.keyword import KeywordProcessor
import pandas as pd
import nltk
import os
import requests
from io import BytesIO
from zipfile import ZipFile
from glob import glob
import pdfplumber
import re
import csv


# Import keywords provided in DBSSystemList
doc = pd.read_csv('DBSSystemListCat1_2.csv')
# Create a list of keywords from the imported file
kw_list = doc['SystemList'].tolist()

keyword_processor = KeywordProcessor()
keyword_processor.add_keywords_from_list(kw_list)

DESTINATION_PATH = os.getcwd() + "/"


#For pdflinkstest.csv set index_col=0 in read_csv method
df = pd.read_csv('pdflinkstest.csv',index_col=0)
df["Zip Link"] =df["Zip Link"].astype(str)
mylist = df["Zip Link"].tolist()
contracturls = df["Link"].tolist()
contracts = df["Contract"].tolist()
empty_list = []
for line in mylist:
	try:
		content = requests.get(line)
		zipfile = ZipFile(BytesIO(content.content))
		zipfile.extractall(DESTINATION_PATH)
		print(zipfile.namelist())
		match = [s for s in zipfile.namelist() if ".pdf" in s][0]
		print(line)		
		print(match)

		text = ''
		pdf = pdfplumber.open(match)

		# Extract text from the created contract PDF
		for page in pdf.pages:
			text = page.extract_text()

		text = ''.join(i for i in text)


		text = text.upper()

		# Clean the imported contract text
		text = text.replace('RED CLOUD', '')
		text = text.replace('CONTRACTORS','')
		text = text.replace('SOLICITATION', '')
		text = text.replace('/', ' ')		
		
		# Scan the document for all keywords provided by the Army team
		keyword_found = keyword_processor.extract_keywords(text)
		
		# Produce a frequency count of keywords present
		kw_frequency = nltk.FreqDist(keyword_found)
		sorted_kw = sorted(kw_frequency.items() , key = lambda x: x[1] ,
		                       reverse = True)
		print(sorted_kw[:5])

		keywords = ','.join(map(str, sorted_kw[:5]))
		empty_list.append([keywords])
	except :
		#if file is not .pdf then append empty list
		empty_list.append([])



#Data will save in samfinal_specific_keywords.csv and in a new column titled 'Top Keywords'
pdfkeywords=pd.DataFrame(empty_list)
pdfkeywords=df.join(pdfkeywords)
pdfkeywords= pdfkeywords.rename(columns={0:'Top Keywords'})
pdfkeywords.to_csv('samfinal_specific_keywords.csv')

