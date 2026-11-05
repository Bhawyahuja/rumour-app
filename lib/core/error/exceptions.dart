/// Exceptions thrown by the data layer (data sources).
///
/// Repositories catch these and convert them into [Failure]s so that the
/// presentation layer never has to deal with SDK specific exceptions.
sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// No connectivity / timeout / host unreachable.
final class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection.']);
}

/// The backend (Firestore / HTTP API) rejected or failed the request.
final class ServerException extends AppException {
  const ServerException([super.message = 'Something went wrong on our side.']);
}

/// The server answered, but the payload was not what we expected.
final class ParsingException extends AppException {
  const ParsingException([super.message = 'Unexpected response from server.']);
}

/// Local persistence failure.
final class CacheException extends AppException {
  const CacheException([super.message = 'Could not access local storage.']);
}
