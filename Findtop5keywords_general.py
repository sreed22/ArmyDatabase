#Import requirement dependecies
import requests
from io import BytesIO
from zipfile import ZipFile
from glob import glob
import os
import pdfplumber
from flashtext.keyword import KeywordProcessor
import pandas as pd
import re
import csv
import nltk
from nltk.corpus import stopwords
nltk.download('stopwords')


DESTINATION_PATH = os.getcwd() + "/"


#NOTE : For pdflinkstest.csv set index_col=0 in read_csv method and for a subset file remove index_col argument
df = pd.read_csv('urlsubset2.csv')
#df = pd.read_csv('pdflinkstest.csv',index_col=0)
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
		# print(zipfile.namelist())
		print(match)

		tokens = []
		pdf = pdfplumber.open(match)
		for page in pdf.pages:
			text = page.extract_text()

		text = ''.join(i for i in text if not i.isdigit())

		text = re.sub(r'\b\w{1}\b', '', text)

		text = text.upper()

		text = text.replace(",", "")
		text = text.replace("'", "")
		text = text.replace("(", "")
		text = text.replace(")", "")
		text = text.replace("-", "")
		text = text.replace("-", "")
		text = text.replace("-", "")
		text = text.replace("\n", " ")
		text = text.replace(":", "")
		text = text.replace("/", "")
		text = text.replace(".", "")

		tokens = text.split(" ")

		take_out = set(nltk.corpus.stopwords.words('english'))		
		take_out = [word.upper() for word in take_out]

		take_out.append('')

		more_stop_words = ['tel', 'ref', 'fax', 'po', 'no']

		take_out.append(more_stop_words)

		tokens = [word for word in tokens if word not in take_out]
		word_frequencies = nltk.FreqDist(tokens)

		sorted_counts = sorted(word_frequencies.items(), key=lambda x: x[1],
							   reverse=True)
		#print(sorted_counts[:5])
		TopKeywords = ','.join(map(str, sorted_counts[:5]))
		print(TopKeywords)
		empty_list.append([TopKeywords])
		

	except:
		empty_list.append([])

#Data will save in samfinal.csv
pdfkeywords=pd.DataFrame(empty_list)
pdfkeywords=df.join(pdfkeywords)
pdfkeywords= pdfkeywords.rename(columns={0:'Top Keywords'})
pdfkeywords.to_csv('samfinal.csv')





