part of 'fetch_date_bloc.dart';

abstract class FetchDateEvent {}

class FetchDateFactEvent extends FetchDateEvent {
  final int month;
  final int day;

  FetchDateFactEvent({required this.month, required this.day});
}
