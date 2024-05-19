# README

Welcome to the README for Microservice A.

The below instructions are for *both* requesting and receiving data. Since
communication happens via HTTP, every request for data is followed by a
response.

## Requesting Data

Communication takes place via HTTP requests.

### GET /ingredients.json

This endpoint returns a list of all ingredients in the microservice.

Python Example:

```
import urllib.request
contents = urllib.request.urlopen("http://service.url/ingredients.json").read()

```

Using the Python [Requests Library](https://docs.python-requests.org/en/latest/)

```
import requests
r = requests.get("http://service.url/ingredients.json")
data = r.json() # parse the response body

for ingredient_json in data:
    ingredient_name = ingredient_json["name"]
    # do stuff with ingredient name
```

Ruby Example:

```
require 'open-uri'
require 'json'
response = open('http://microservice.url/ingredients.json').read
data = JSON.parse(response)
data.each do |ingredient_json|
    name = ingredient_json["name"]
    # do stuff with ingredient name
end
```

### POST /ingredients.json

This endpoint is for creating an ingredient within the system.

Using the Python [Requests Library](https://docs.python-requests.org/en/latest/)

```
import requests

request_body = {
    "ingredient": {
        "name": "Olive Oil"
    }
}

r = requests.post("http://service.url/ingredients.json", data=request_body)

if r.status_code == 200:
    # request succeeded
    response_data = r.json()

    # ingredient_id is returned in response, use this to request the ingredient later.
    ingredient_id = response_data["id"]
```

### GET /ingredients/:id.json

Get the details for an ingredient for a given ID.

```
import urllib.request
contents = urllib.request.urlopen("http://service.url/ingredients/1.json").read()
```

Using the Python [Requests Library](https://docs.python-requests.org/en/latest/)

```
import requests
r = requests.get("http://service.url/ingredients/1.json")
ingredient_json = r.json() # parse the response body
ingredient_json["name"] # ingredient name
```

Ruby Example:

```
require 'open-uri'
require 'json'
response = open('http://microservice.url/ingredients.json').read
ingredient_json = JSON.parse(response)
ingredient_json["name"] # ingredient name
```
