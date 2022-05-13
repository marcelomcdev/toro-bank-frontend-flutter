abstract class UserException implements Exception {}

class InvalidTextError implements UserException {}

class InvalidIdentifierError implements UserException {}

class DataSourceError implements UserException {
  final String message;
  DataSourceError(this.message);
}
