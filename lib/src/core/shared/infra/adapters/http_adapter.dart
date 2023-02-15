import 'dart:async';

abstract class HttpAdapter<T> {
  FutureOr<T> get(String url);

  FutureOr<T> post(String url, dynamic body);

  FutureOr<T> put(String url, dynamic body);
}
