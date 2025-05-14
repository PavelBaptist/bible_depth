// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';

import 'package:bible_depth/library.dart';
import 'package:shared/shared.dart';

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
    // final appLocale = S.of(context);
    return BlocProvider(
      create: (context) =>
          AnalysisBloc(idFragment: fragment.id)..add(AnalysisInitEvent()),
      child:
          BlocBuilder<AnalysisBloc, AnalysisState>(builder: (context, state) {
        final bloc = context.read<AnalysisBloc>();
        return Scaffold(
          appBar: AppBar(
            title: Text(fragment.name),
            actions: [
              IconButton(
                onPressed: state.cashWord.isNotEmpty
                    ? () => bloc.add(CancelEvent(true))
                    : null,
                icon: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: state.cashWord.isNotEmpty
                      ? theme.textPrimary
                      : theme.grey,
                ),
              ),
              IconButton(
                onPressed: state.secondCash.isNotEmpty
                    ? () => bloc.add(CancelEvent(false))
                    : null,
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: state.secondCash.isNotEmpty
                      ? theme.textPrimary
                      : theme.grey,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          bottomNavigationBar: CustomBottomMenu(
            onTap: (tool) => bloc.add(FloatingMenuEvent(toolsBar: tool)),
            selectedToolBar: state.toolsBar,
          ),
          floatingActionButton: switch (state.toolsBar) {
            ToolsBar.style => FloatingMenuStyles(
                styles: state is AnalysisLoaded ? state.wordStyles : [],
                selectedStyle: state.style,
                onSelectedStyle: (style) =>
                    bloc.add(SelectesStyleEvent(style: style)),
                create: (style) {
                  bloc.add(CreateNewStyleEvent(style));
                },
                onReorder: (oldIndex, newIndex) =>
                    bloc.add(ReordableEvent(oldIndex, newIndex)),
                delete: (style) => bloc.add(DeleteEvent(style)),
              ),
            ToolsBar.structural => const FloatingMenu(),
            ToolsBar.comment => const FloatingMenu(),
            ToolsBar.enter => null,
            ToolsBar.pencil => FloatingMenuPencil(
                onIncrease: () => bloc.add(IncreaseOrReduceEvent(false)),
                onReduce: () => bloc.add(IncreaseOrReduceEvent(true)),
                changeModeNewLine: () => bloc.add(ChangeModeNewLineEvent()),
                eraserMode: state.tools == Tools.eraser,
                onEraser: () => bloc.add(EraserEvent()),
              ),
            _ => null,
          },
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          body: state is AnalysisLoaded
              ? VersesListWidget(
                  words: state.words,
                  onTap: (word) => bloc.add(AddStyleWordEvent(word: word)),
                  sizeText: state.sizaText,
                  newLineByVerse: state.newLineByVerse,
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
