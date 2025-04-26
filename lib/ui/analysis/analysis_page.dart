// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

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
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    return BlocProvider(
      create: (context) =>
          AnalysisBloc(idFragment: fragment.id)..add(AnalysisInitEvent()),
      child:
          BlocBuilder<AnalysisBloc, AnalysisState>(builder: (context, state) {
        final bloc = context.read<AnalysisBloc>();
        return Scaffold(
          // floatingActionButton:
          //     (state is FragmentLoaded) && state.fragments.isNotEmpty
          //         ? ElevatedButton(
          //             onPressed: () {
          //               context.router
          //                   .push(ChoiceBookRoute(folders: state.folders));
          //             },
          //             style: ElevatedButton.styleFrom(
          //               shape: const CircleBorder(),
          //               backgroundColor: theme.backgroundPrimary,
          //               padding: const EdgeInsets.all(16),
          //               side: BorderSide(color: theme.textPrimary, width: 2),
          //             ),
          //             child: Icon(
          //               Icons.add_rounded,
          //               size: 40,
          //               color: theme.textPrimary,
          //             ),
          //           )
          //         : null,
          appBar: AppBar(title: Text(fragment.name)),
          body: state is AnalysisLoaded
              ? VersesListWidget(
                  verses: state.verses,
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

class VersesListWidget extends StatelessWidget {
  const VersesListWidget(
      {super.key, required this.verses, required this.onTap});

  final List<Verse> verses;
  final Function(Word word) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    return verses.isNotEmpty
        ? ListView.separated(
            padding: const EdgeInsets.all(GeneralConstants.padding)
                .copyWith(bottom: 200),
            itemBuilder: (_, index) => Wrap(
              spacing: 12,
              children: List.generate(
                verses[index].words.length,
                (iWord) => GestureDetector(
                  onTap: () => onTap(verses[index].words[iWord]),
                  child: Text(
                    verses[index].words[iWord].value,
                    style: theme.jura500x16.copyWith(color: theme.textPrimary),
                  ),
                ),
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemCount: verses.length,
          )
        : const SizedBox();
  }
}
