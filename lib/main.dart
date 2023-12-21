import 'package:flutter/material.dart';
import 'package:magic_number/data/network/network_module.dart';
import 'package:magic_number/features/app/app.dart';
import 'package:magic_number/features/date/data/di/date_network_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await provideNetwork();
  await provideDate();
  runApp(const MagicNumberApp());
}
