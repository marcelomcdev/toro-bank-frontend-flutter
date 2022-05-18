abstract class UserException implements Exception {}

class InvalidTextError implements UserException {}

class InvalidIdentifierError implements UserException {}

class DataSourceError implements UserException {
  final String message;
  DataSourceError(this.message);
}

//Assets
abstract class AssetException implements Exception {}

class InvalidAssetTextError implements AssetException {}

class InvalidAssetIdentifierError implements AssetException {}

class AssetDataSourceError implements AssetException {
  final String message;
  AssetDataSourceError(this.message);
}

//MostNegotiatedAsset
abstract class TrendException implements Exception {}

class InvalidTrendTextError implements TrendException {}

class InvalidTrendIdentifierError implements TrendException {}

class TrendDataSourceError implements TrendException {
  final String message;
  TrendDataSourceError(this.message);
}

abstract class OrderException implements Exception {}

class InvalidOrderTextError implements OrderException {}

class InvalidOrderIdentifierError implements OrderException {}

class OrderDataSourceError implements OrderException {
  final String message;
  OrderDataSourceError(this.message);
}

abstract class UserPositionException implements Exception {}

class InvalidUserPositionTextError implements UserPositionException {}

class InvalidUserPositionIdentifierError implements UserPositionException {}

class UserPositionDataSourceError implements UserPositionException {
  final String message;
  UserPositionDataSourceError(this.message);
}
