import 'package:dio/dio.dart';
import 'package:magic_number/core/constant.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../dto/date_dto.dart';

part 'date_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class DateApi {
  factory DateApi(Dio dio) = _DateApi;

  @GET('{month}/{day}/date')
  Future<HttpResponse<DateDto>> getDateFact(
      @Path("month") int month,
      @Path("day") int day,
      @Query("fragment") bool? isContainLarger,
      @Query("json") bool? isJson);
}
