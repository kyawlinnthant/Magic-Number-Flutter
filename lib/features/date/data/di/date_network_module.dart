import 'package:dio/dio.dart';
import 'package:magic_number/features/date/data/remote/date_api.dart';
import 'package:magic_number/features/date/data/repository/date_repository_impl.dart';
import 'package:magic_number/features/date/domain/repository/date_repository.dart';
import 'package:magic_number/features/date/domain/usecase/fetch_date_fact.dart';
import 'package:magic_number/features/date/presentation/bloc/fetch_date_bloc.dart';

import '../../../../core/di.dart';

Future<void> provideDate() async {
  sl.registerSingleton<DateApi>(DateApi(sl<Dio>()));
  sl.registerSingleton<DateRepository>(DateRepositoryImpl(sl<DateApi>()));
  sl.registerFactory<FetchDateFactUseCase>(
      () => FetchDateFactUseCase(sl<DateRepository>()));
  sl.registerFactory<FetchDateBloc>(
      () => FetchDateBloc(sl<FetchDateFactUseCase>()));
}
