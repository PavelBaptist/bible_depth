// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

import 'package:bible_depth/library.dart';

@RoutePage()
class ChoiceFragmentPage extends StatelessWidget {
  const ChoiceFragmentPage({
    Key? key,
    required this.book,
    required this.folders,
  }) : super(key: key);

  final Book book;
  final List<Folder> folders;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    return BlocProvider(
      create: (context) => ChoiceFragmentBloc(book: book),
      child: BlocBuilder<ChoiceFragmentBloc, ChoiceFragmentState>(
          builder: (context, state) {
        final bloc = context.read<ChoiceFragmentBloc>();
        return Scaffold(
          appBar: AppBar(
            title: Text(book.bookName),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: state is ChoiceFragmentView &&
                  state.fragment != null
              ? SizedBox(
                  width: 290,
                  child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ChoiceFolder(
                            add: (folder) {
                              bloc.add(CreateNewFragment(folder: folder));
                              context.router.popUntilRoot();
                            },
                            folders: folders,
                            createNewFolder: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (context) => CreateFolder(
                                  add: (name) {
                                    bloc.add(
                                        CreateNewFolderAndFragment(name: name));
                                    context.router.popUntilRoot();
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: theme.backgroundAbsolutlyDark,
                        foregroundColor: Colors.white,
                        disabledForegroundColor:
                            const Color.fromRGBO(170, 171, 174, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide.none,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            appLocale.create,
                            style: theme.jura700x20,
                          ),
                          Text(
                            state.linkText,
                            style: theme.jura700x20,
                          )
                        ],
                      )),
                )
              : null,
          body: state is ChoiceFragmentView
              ? SelectedFragmentWidget(
                  fragment: state.fragment,
                  book: book,
                  selectVerse: (verse) => bloc.add(
                    ChoiceFragmentSelectVerse(verse: verse),
                  ),
                )
              : const SizedBox(),
        );
      }),
    );
  }
}

class SelectedFragmentWidget extends StatelessWidget {
  const SelectedFragmentWidget(
      {super.key,
      required this.fragment,
      required this.book,
      required this.selectVerse});

  final Fragment? fragment;
  final Book book;
  final void Function(Verse verse) selectVerse;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    return ListView.separated(
      padding:
          const EdgeInsets.all(GeneralConstants.padding).copyWith(bottom: 200),
      itemBuilder: (_, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0)
              Text(
                appLocale.selectAnExcerptToStudy,
                style: theme.jura500x16.copyWith(color: theme.textPrimary),
              ),
            if (index == 0) const SizedBox(height: 16),
            ChapterWidget(
              chapter: book.chapters[index],
              fragment: fragment,
              selectVerse: (verse) => selectVerse(verse),
            ),
          ],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: book.chapters.length,
    );
  }
}
