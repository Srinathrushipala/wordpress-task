import requests

url = "url of wordpress"

data = {
    "title": "New post",
    "body": "This is the body of the new post.",
    "userId": 1
}

response = requests.post(url, json=data)

if response.status_code == 201:
    print("Post added successfully.")
else:
    print(f"Failed to add post. Status code: {response.status_code}")
