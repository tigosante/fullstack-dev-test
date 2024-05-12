mixin AppEnv {
  static String get firebaseAppId =>
      const String.fromEnvironment('FIREBASE_APP_ID');

  static String get firebaseApiKey =>
      const String.fromEnvironment('FIREBASE_API_KEY');

  static String get firebaseAuthDomain =>
      const String.fromEnvironment('FIREBASE_AUTH_DOMAIN');

  static String get firebaseProjectId =>
      const String.fromEnvironment('FIREBASE_PROJECT_ID');

  static String get firebaseStorageBucket =>
      const String.fromEnvironment('FIREBASE_STORE_BUCKET');

  static String get firebaseMessagingSenderId =>
      const String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');

  static String get geminiApiKey =>
      const String.fromEnvironment('GEMINI_API_KEY');
}
