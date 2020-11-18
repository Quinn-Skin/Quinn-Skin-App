import requests
import json

# url = ' https://quinn-model.herokuapp.com/predict'
url = ' https://quinn-model.herokuapp.com/productid'
data = [[2,10,5,1, 0, 1, 0, 1]]
j_data = json.dumps(data)
headers = {'content-type': 'application/json','Accept-Charset': 'UTF-8'}
r = requests.post(url, data=j_data, headers=headers)
print(r, r.text)

