export class Logger {
  static success(message: string) {
    console.log(`✅ - ${message}`);
  }

  static info(message: string) {
    console.log(`⚪ - ${message}`);
  }
}
