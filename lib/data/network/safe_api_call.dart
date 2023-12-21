import 'dart:io';
import 'package:magic_number/data/network/network_response.dart';
import 'package:retrofit/retrofit.dart';

Future<NetworkResponse<T>> safeApiCall<T>(
    Future<HttpResponse<T>> Function() apiCall) async {
  try {
    final response = await apiCall();
    if (response.response.statusCode == null) {
      return NetworkFailed(
          message: response.response.statusMessage ?? "Something's wrong");
    }
    if (response.response.statusCode! == HttpStatus.ok) {
      final body = response.data;
      return NetworkSuccess(data: body);
    }
    return NetworkFailed(message: response.response.statusMessage ?? "Failed");
  } catch (e) {
    if (e is SocketException) {
      return NetworkFailed(message: e.message);
    } else if (e is HttpException) {
      return NetworkFailed(message: e.message);
    } else {
      return NetworkFailed(message: 'SafeApiCall exception');
    }
  }
}
