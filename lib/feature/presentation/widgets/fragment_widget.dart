import 'dart:math';

import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_state.dart';
import 'package:bible_depth/feature/presentation/bloc/words_bloc/words_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/words_bloc/words_state.dart';
import 'package:bible_depth/feature/presentation/widgets/sceleton_widget.dart';
import 'package:bible_depth/feature/presentation/widgets/word_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FragmentWidget extends StatelessWidget {
  const FragmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<WordsBloc, WordsState>(
          builder: (context, state) {
            if (state is WordsLoadingState) {
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
            } else if (state is WordsLoadedState) {
              return Wrap(
                spacing: 4,
                children: (state.wordEntityList
                    .map((e) => WordWidget(wordEntity: e))).toList(),
              );
            } else {
              throw 'Неизвестное состояние';
            }
          },
        ),
      ),
    );
  }
}
