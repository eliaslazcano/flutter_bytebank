import 'package:flutter_bytebank/http/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

const baseUrl = 'http://192.168.100.187:8080';
const timeout = 5;

final Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: timeout)
);
