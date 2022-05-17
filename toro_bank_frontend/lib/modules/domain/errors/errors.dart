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
