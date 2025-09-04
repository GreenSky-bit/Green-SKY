#!/bin/bash

# Variables (customize as needed)
KEYSTORE_NAME="green-sky-release-key.jks"
KEY_ALIAS="green-sky-key"
KEYSTORE_PASS="YourStrongPassword123!"
KEY_PASS="YourStrongPassword123!"
DNAME="CN=GreenSky, OU=Dev, O=GreenSky, L=City, S=State, C=US"
VALIDITY_DAYS=10000

# Remove existing keystore if present
rm -f "$KEYSTORE_NAME"

# Generate keystore
keytool -genkeypair \
  -v \
  -keystore "$KEYSTORE_NAME" \
  -alias "$KEY_ALIAS" \
  -keyalg RSA \
  -keysize 2048 \
  -validity $VALIDITY_DAYS \
  -storepass "$KEYSTORE_PASS" \
  -keypass "$KEY_PASS" \
  -dname "$DNAME"

# Output SHA-1 and SHA-256
echo "SHA-1:"
keytool -list -v -keystore "$KEYSTORE_NAME" -alias "$KEY_ALIAS" -storepass "$KEYSTORE_PASS" -keypass "$KEY_PASS" | grep 'SHA1:' | awk '{print $2}'

echo "SHA-256:"
keytool -list -v -keystore "$KEYSTORE_NAME" -alias "$KEY_ALIAS" -storepass "$KEYSTORE_PASS" -keypass "$KEY_PASS" | grep 'SHA256:' | awk '{print $2}'}]},{