
import 'package:magic_number/data/network/dio_builder.dart';

import '../../core/di.dart';

Future<void> provideNetwork() async {
  sl.registerSingleton(DioBuilder().instance());
}