sealed class DataState<T> {
  final T? data;
  final String? message;

  const DataState({this.data, this.message});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({required T data}) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({required String message}) : super(message: message);
}
