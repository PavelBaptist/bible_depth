import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_state.dart';
import 'package:bible_depth/feature/presentation/widgets/fragment_widget.dart';
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
        body: Container(
          color: theme.appBarTheme.backgroundColor,
          child: SafeArea(
            top: true,
            left: false,
            right: false,
            bottom: false,
            child: Container(
              color: theme.scaffoldBackgroundColor,
              child: Stack(children: [
                FragmentWidget(),
              ]),
            ),
          ),
        ),
      ),
    );

    // var state = BlocProvider.of<FragmentBloc>(context, listen: false);
    // state.add(const FragmentById(1));

    // return BlocBuilder<FragmentBloc, FragmentState>(
    //   builder: (context, state) {
    //     if (state is FragmentLoading) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (state is FragmentLoaded) {
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: Text(state.fragmentEntity.name),
    //         ),
    //         body: _bodyFragment(state),
    //       );
    //     } else {
    //       return Text('no data');
    //     }
    //   },
    // );
  }
}

//   Widget _bodyFragment(FragmentLoaded state) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       child: Wrap(
//         children:
//             (state.fragmentEntity.text.map((e) => Word(text: e))).toList(),
//       ),
//     );
//   }
// // }

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
