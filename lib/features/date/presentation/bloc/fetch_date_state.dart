part of 'fetch_date_bloc.dart';

sealed class FetchDateState {}

class FetchDateInitial extends FetchDateState {}

class DateLoading extends FetchDateState {}

class DateError extends FetchDateState {
  final String message;

  DateError({required this.message});
}

class DateData extends FetchDateState {
  final DateVo data;

  DateData({required this.data});
}
