import 'package:dio/dio.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  String apiKey = "07f30e529amsh5b76c41ec47f003p1d3919jsn46b185378310";
  String host = "numbersapi.p.rapidapi.com";

  // X-RapidAPI-Key
  // X-RapidAPI-Host

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["X-RapidAPI-Key"] = apiKey;
    options.headers["X-RapidAPI-Host"] = host;
    print("why.req ${options.headers}");
    super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}
