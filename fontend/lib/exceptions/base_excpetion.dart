abstract class BaseException implements Exception {
  BaseException({
    required this.code,
    this.message,
  });

  final String code;
  final String? message;
}
