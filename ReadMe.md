# Load Balancing a Secure ditributed gRPC Application

Here's all the files (almost) you'll need to deploy the application describe in my medium article: <link to come>

To use the python JWT generator script just run the following command:
```python
python3 gen_jwt.py
```
and make sure that jwt is installed (pip)

To use the ssl certificate generator script please run the following command:

```bash
chmod +x create_ssl_cert.sh
./create_ssl_cert.sh <your domain ip/or name>
```
