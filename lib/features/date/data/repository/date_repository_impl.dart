import 'package:magic_number/core/date_state.dart';
import 'package:magic_number/data/network/network_response.dart';
import 'package:magic_number/data/network/safe_api_call.dart';
import 'package:magic_number/features/date/data/remote/date_api.dart';
import 'package:magic_number/features/date/domain/repository/date_repository.dart';

import '../dto/date_dto.dart';

class DateRepositoryImpl extends DateRepository {
  DateApi api;

  DateRepositoryImpl(this.api);

  @override
  Future<DataState<DateDto>> fetchDateFact(
      {required int month, required int day}) async {
    final response =
        await safeApiCall(() => api.getDateFact(month, day, true, true));
    switch (response) {
      case NetworkSuccess<DateDto>():
        return DataSuccess<DateDto>(data: response.data!);
      case NetworkFailed():
        return DataFailed<DateDto>(message: response.message!);
    }
  }
}
