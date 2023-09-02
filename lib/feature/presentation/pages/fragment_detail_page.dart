import 'package:bible_depth/feature/presentation/bloc/fragment_detail/fragment_detail_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_detail/fragment_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FragmentDetailPage extends StatelessWidget {
  const FragmentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<FragmentDetailBloc>(context, listen: false);
    state.add(const FragmentDetailById(1));

    return BlocBuilder<FragmentDetailBloc, FragmentDetailState>(
      builder: (context, state) {
        if (state is FragmentDetailLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FragmentDetailLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.fragmentEntity.name),
            ),
          );
        } else {
          return Text('no data');
        }
      },
    );
  }
}
