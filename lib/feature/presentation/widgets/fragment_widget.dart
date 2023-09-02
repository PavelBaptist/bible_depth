import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FragmentWidget extends StatelessWidget {
  const FragmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // BLoC.
    final fragmentBloc = BlocProvider.of<FragmentBloc>(context);
    FragmentState state = fragmentBloc.state;

    if (state is FragmentLoadedState) {
      return Text(state.fragmentEntity.name);
    } else {
      return Text('Loading...');
    }
  }
}
