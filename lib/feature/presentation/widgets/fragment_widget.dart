import 'dart:math';

import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_state.dart';
import 'package:bible_depth/feature/presentation/widgets/sceleton_widget.dart';
import 'package:bible_depth/feature/presentation/widgets/word_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FragmentWidget extends StatelessWidget {
  const FragmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fragmentBloc = BlocProvider.of<FragmentBloc>(context);
    FragmentState state = fragmentBloc.state;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<FragmentBloc, FragmentState>(
        builder: (context, state) {
          if (state is FragmentLoadingState) {
            return Wrap(
              spacing: 10,
              runSpacing: 4,
              children: [
                SceletonWidget(30, 15),
                SceletonWidget(40, 15),
                SceletonWidget(53, 15),
                SceletonWidget(14, 15),
                SceletonWidget(53, 15),
                SceletonWidget(60, 15),
                SceletonWidget(24, 15),
                SceletonWidget(61, 15),
                SceletonWidget(15, 15),
                SceletonWidget(40, 15),
                SceletonWidget(53, 15),
                SceletonWidget(14, 15),
                SceletonWidget(53, 15),
                SceletonWidget(60, 15),
                SceletonWidget(24, 15),
                SceletonWidget(61, 15),
                SceletonWidget(15, 15),
              ],
            );
          } else if (state is FragmentLoadedState) {
            return Wrap(
              children: (state.fragmentEntity.text
                  .map((e) => WordWidget(wordEntity: e))).toList(),
            );
          } else {
            throw 'Неизвестное состояние';
          }
        },
      ),
    );
  }
}
