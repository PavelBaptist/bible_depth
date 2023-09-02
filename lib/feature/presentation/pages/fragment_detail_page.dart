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
            body: _bodyFragmentDetail(state),
          );
        } else {
          return Text('no data');
        }
      },
    );
  }

  Widget _bodyFragmentDetail(FragmentDetailLoaded state) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Wrap(
        children: (state.fragmentEntity.text.map((e) => Text(" $e"))).toList(),
      ),
    );
  }
}
