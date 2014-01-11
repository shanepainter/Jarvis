#!/usr/bin/python

import wolframalpha
import sys

# Get a free API key here http://products.wolframalpha.com/api/
# This is a fake ID, go and get your own, instructions on my blog.
app_id='J8P67W-V782GXWJ8Y'
client = wolframalpha.Client(app_id)


def query_wolfram(values):
    print 'In QueryProcess'
    query = ' '.join(str(value) for value in values)
    res = client.query(query)
    for key,value in res: 
	print 'res['+key+']='+value
    if len(res.pods) > 0:
        texts = ""
        pod = res.pods[1]
        if pod.text:
            texts = pod.text
        else:
            texts = "I have no answer for that"
        # to skip ascii character in case of error
        texts = texts.encode('ascii', 'ignore')
        print texts
	return [True, texts]
    else:
        print "Sorry, I am not sure. Perhaps, rephrase your question?"
        return [False, "Sorry, I am not sure. Perhaps, rephrase your question?"]
