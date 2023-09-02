import 'package:bible_depth/feature/presentation/bloc/fragment_detail/fragment_detail_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_detail/fragment_detail_state.dart';
import 'package:bible_depth/feature/presentation/pages/fragment_detail_page.dart';
import 'package:bible_depth/locator_service.dart' as di;
import 'package:bible_depth/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FragmentDetailBloc>(
      create: (context) => sl<FragmentDetailBloc>(),
      child: MaterialApp(
        home: FragmentDetailPage(),
      ),
    );
  }
}
