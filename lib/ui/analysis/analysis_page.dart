// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';

import 'package:bible_depth/library.dart';

@RoutePage()
class AnalysisPage extends StatelessWidget {
  const AnalysisPage({
    Key? key,
    required this.fragment,
  }) : super(key: key);

  final Fragment fragment;

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
    // final appLocale = S.of(context);
    return BlocProvider(
      create: (context) =>
          AnalysisBloc(idFragment: fragment.id)..add(AnalysisInitEvent()),
      child:
          BlocBuilder<AnalysisBloc, AnalysisState>(builder: (context, state) {
        final bloc = context.read<AnalysisBloc>();
        return Scaffold(
          appBar: AppBar(title: Text(fragment.name)),
          body: state is AnalysisLoaded
              ? VersesListWidget(
                  words: state.words,
                  onTap: (word) => bloc.add(AddStyleWordEvent(word: word)),
                )
              : const Padding(
                  padding: EdgeInsets.only(bottom: 100.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
        );
      }),
    );
  }
}
