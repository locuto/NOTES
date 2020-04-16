# IN THIS CSR IS NOT GENERATED SEPARATELY
# Also, there is a step to remove passphrase from key

# https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/

#- GENERATE KEY
# NOTE: This asks for a passphrase

openssl genrsa -des3 -out myCA.key.withPassPhrase 2048

#- GENERATE CERT
# NOTE: This asks for the passphrase entered earlier in key generation

openssl req -x509 -new -nodes -key myCA.key.withPassPhrase -sha256 -days 1825 -out myCA.pem

#- REMOVE PASSPHRASE FROM KEY
# https://serverfault.com/questions/543385/restarting-nginx-keeps-asking-pem-pass-phrase
# NOTE: Provide the same passphrase entered earlier in key generation

openssl rsa -in myCA.key.withPassPhrase -out myCA.key
