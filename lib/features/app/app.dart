import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_number/features/date/presentation/bloc/fetch_date_bloc.dart';
import 'package:magic_number/features/home/home_page.dart';

import '../../core/di.dart';

class MagicNumberApp extends StatelessWidget {
  const MagicNumberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<FetchDateBloc>()),
      ],
      child: MaterialApp(
        title: 'Magic Number',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
