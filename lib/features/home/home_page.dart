import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_number/features/date/presentation/bloc/fetch_date_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDateBloc, FetchDateState>(
      builder: (context, state) {
        switch (state) {
          case FetchDateInitial():
            return const Text('fetch initial');
          case DateLoading():
            return const Text('fetch loading');
          case DateError():
            return Text(state.message);
          case DateData():
            return Text(state.data.description);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchDateBloc>(context)
        .add(FetchDateFactEvent(month: 1, day: 1));
  }
}
