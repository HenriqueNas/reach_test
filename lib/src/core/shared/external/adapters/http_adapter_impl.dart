import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../configs/env.dart';
import '../../infra/adapters/http_adapter.dart';

class HttpAdapterImpl implements HttpAdapter<Response> {
  late final Dio _client;

  static String getMD5Hash(String timestamp) {
    final publicKey = dotenv.get(Env.API_PUBLIC_KEY.name);
    final privateKey = dotenv.get(Env.API_PRIVATE_KEY.name);

    final stringToEncode = '$timestamp$privateKey$publicKey';

    final hash = md5.convert(utf8.encode(stringToEncode)).toString();

    return hash;
  }

  HttpAdapterImpl.create() {
    // final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final timestamp = '1';
    final hash = getMD5Hash(timestamp);

    _client = Dio(
      BaseOptions(
        baseUrl: dotenv.get(Env.API_URL.name),
        // passing keys as query parameters to don't need interceptors
        queryParameters: {
          'ts': timestamp,
          'apikey': dotenv.get(Env.API_PUBLIC_KEY.name),
          'hash': hash,
        },
      ),
    );
  }

  @override
  FutureOr<Response> get(String url) async {
    return await _client.get(url);
  }

  @override
  FutureOr<Response> post(String url, body) async {
    return await _client.post(url, data: body);
  }

  @override
  FutureOr<Response> put(String url, body) async {
    return await _client.put(url, data: body);
  }
}
