import 'package:magic_number/core/date_state.dart';
import 'package:magic_number/core/usecase.dart';
import 'package:magic_number/features/date/data/dto/date_dto.dart';
import 'package:magic_number/features/date/domain/repository/date_repository.dart';

import '../../presentation/bloc/fetch_date_bloc.dart';
import '../model/date_vo.dart';

class FetchDateFactUseCase extends UseCase<DataState,FetchDateFactEvent>{
  DateRepository repository;

  FetchDateFactUseCase(this.repository);

  @override
  Future<DataState<DateVo>> invoke({FetchDateFactEvent? params}) async {
    print("why. ${params!.month} : ${params.day}");
    final repoResponse = await repository.fetchDateFact(month: params!.month, day: params.day);
    switch(repoResponse) {
      case DataSuccess<DateDto>(): return DataSuccess(data: repoResponse.data!.toVo());
      case DataFailed<DateDto>(): return DataFailed(message: repoResponse.message!);
    }
  }
}