import admin from "firebase-admin";
var serviceAccount = require("../files/serviceAccountKey.json");

export function fireStoreDB(): admin.firestore.Firestore {
  const firebase = admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
  });
  return firebase.firestore();
}
