import jwt
from time import time

privateKey = open('./jwt-key', 'r').read()
payload = {
            'iat': time(),
            'exp': time() + 86400,
            'iss': "test@gmail.com",
            'sub': "test@gmail.com",
            'email': "test@gmail.com",
            'aud': "bookstore"
        }
token = jwt.encode(payload, privateKey, algorithm='RS256').decode('utf-8')

print(token)
