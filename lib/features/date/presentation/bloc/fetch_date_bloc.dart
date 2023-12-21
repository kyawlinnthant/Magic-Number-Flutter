import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_number/features/date/domain/model/date_vo.dart';

import '../../../../core/date_state.dart';
import '../../domain/usecase/fetch_date_fact.dart';

part 'fetch_date_event.dart';

part 'fetch_date_state.dart';

class FetchDateBloc extends Bloc<FetchDateEvent, FetchDateState> {
  FetchDateFactUseCase useCase;

  FetchDateBloc(this.useCase) : super(FetchDateInitial()) {
    on<FetchDateEvent>((event, emit) async {
      switch (event) {
        case FetchDateFactEvent():
          await fetchDate(event, emit);
      }
    });
  }

  Future<void> fetchDate(
      FetchDateFactEvent event, Emitter<FetchDateState> emitter) async {
    emitter(DateLoading());
    DataState<DateVo> dataState = await useCase.invoke(params: event);
    switch (dataState) {
      case DataSuccess():
        emitter(DateData(data: dataState.data!));
        break;
      case DataFailed():
        emitter(DateError(message: dataState.message!));
        break;
    }
  }
}
