#!/bin/bash

FILE_PATH=${PWD/\/scripts\/frontend/}/frontend/env.json
touch $FILE_PATH

for i in "$@" ; do
  case $i in
    --firebase-app-id=*)
      FIREBASE_APP_ID="${i#*=}"
      shift
      ;;
    --firebase-api-key=*)
      FIREBASE_API_KEY="${i#*=}"
      shift
      ;;
    --firebase-auth-domain=*)
      FIREBASE_AUTH_DOMAIN="${i#*=}"
      shift
      ;;
    --firebase-project-id=*)
      FIREBASE_PROJECT_ID="${i#*=}"
      shift
      ;;
    --firebase-store-bucket=*)
      FIREBASE_STORE_BUCKET="${i#*=}"
      shift
      ;;
    --firebase-messaging-sender-id=*)
      FIREBASE_MESSAGING_SENDER_ID="${i#*=}"
      shift
      ;;
    --gemini-api-key=*)
      GEMINI_API_KEY="${i#*=}"
      shift
      ;;
    *)
      echo "Unknown option"
      ;;
  esac
done

echo '{
  "FIREBASE_APP_ID": "'$FIREBASE_APP_ID'",
  "FIREBASE_API_KEY": "'$FIREBASE_API_KEY'",
  "FIREBASE_AUTH_DOMAIN": "'$FIREBASE_AUTH_DOMAIN'",
  "FIREBASE_PROJECT_ID": "'$FIREBASE_PROJECT_ID'",
  "FIREBASE_STORE_BUCKET": "'$FIREBASE_STORE_BUCKET'",
  "FIREBASE_MESSAGING_SENDER_ID": "'$FIREBASE_MESSAGING_SENDER_ID'",
  "GEMINI_API_KEY": "'$GEMINI_API_KEY'"
}' >> $FILE_PATH
