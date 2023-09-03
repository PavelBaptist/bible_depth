import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_state.dart';
import 'package:bible_depth/feature/presentation/widgets/fragment_widget.dart';
import 'package:bible_depth/feature/presentation/widgets/sceleton_widget.dart';
import 'package:bible_depth/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FragmentPage extends StatelessWidget {
  const FragmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: ((context) =>
                sl<FragmentBloc>()..add(const FragmentByIdEvent(1)))),
        //BlocProvider(create: ((context) => sl<WordSettingBloc>())),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<FragmentBloc, FragmentState>(
            builder: (context, state) {
              if (state is FragmentLoadingState) {
                return SceletonWidget(200, 20);
              } else if (state is FragmentLoadedState) {
                return Text(state.fragmentEntity.name);
              } else {
                return const Text('ERROR');
              }
            },
          ),
        ),
        body: FragmentWidget(),
      ),
    );
  }
}

// class Word extends StatelessWidget {
//   var text;
//   Word({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     var state = BlocProvider.of<FragmentBloc>(context, listen: false);

//     return GestureDetector(
//       onTap: () {
//         text = 'fff';
//       },
//       child: Text(" $text"),
//     );
//   }
// }
