import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:fullstack_dev_test/infra/infra.dart';

mixin DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return FirebaseOptions(
      appId: AppEnv.firebaseAppId,
      apiKey: AppEnv.firebaseApiKey,
      projectId: AppEnv.firebaseProjectId,
      authDomain: AppEnv.firebaseAuthDomain,
      storageBucket: AppEnv.firebaseStorageBucket,
      messagingSenderId: AppEnv.firebaseMessagingSenderId,
    );
  }
}
