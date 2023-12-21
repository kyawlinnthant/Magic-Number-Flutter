sealed class NetworkResponse<T> {
  final T? data;
  final String? message;

  NetworkResponse({this.data, this.message});
}

class NetworkSuccess<T> extends NetworkResponse<T> {
  NetworkSuccess({required T data}) : super(data: data);
}

class NetworkFailed<T> extends NetworkResponse<T> {
  NetworkFailed({required String message}) : super(message: message);
}
