import 'package:magic_number/features/date/data/dto/date_dto.dart';

import '../../../../core/date_state.dart';

abstract class DateRepository {
  Future<DataState<DateDto>> fetchDateFact({
    required int month,
    required int day,
  });
}
