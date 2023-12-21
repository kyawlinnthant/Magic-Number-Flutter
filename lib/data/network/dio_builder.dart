import 'package:dio/dio.dart';
import 'package:magic_number/data/network/header_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioBuilder {
  Dio instance() {
    Dio dio = Dio();
    dio.interceptors
        .add(PrettyDioLogger(requestHeader: true, requestBody: true));
    dio.interceptors.add(HeaderInterceptor());
    return dio;
  }
}
