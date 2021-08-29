class ExceptionWithMessages implements Exception {
  final String message;

  ExceptionWithMessages(this.message);
}

class IncorrectLoginDataException extends ExceptionWithMessages {
  IncorrectLoginDataException(String message) : super(message);
}