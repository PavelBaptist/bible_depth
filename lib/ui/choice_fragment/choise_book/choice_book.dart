// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

import 'package:bible_depth/library.dart';

@RoutePage()
class ChoiceBookPage extends StatelessWidget {
  const ChoiceBookPage({
    Key? key,
    required this.folders,
  }) : super(key: key);

  final List<Folder> folders;

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
    // final appLocale = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).choiceBook),
      ),
      body: BlocBuilder<ChoiceBookBloc, ChoiceBookState>(
          bloc: ChoiceBookBloc()..add(ChoiceBookInitEvent()),
          builder: (context, state) {
            if (state is ChoiceBookLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ChoiceBookLoaded) {
              return BooksView(
                books: state.books,
                folders: folders,
              );
            }
            return const SizedBox();
          }),
    );
  }
}

class BooksView extends StatelessWidget {
  const BooksView({
    Key? key,
    required this.books,
    required this.folders,
  }) : super(key: key);

  final List<Book> books;
  final List<Folder> folders;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    // final appLocale = S.of(context);
    return ListView.separated(
      padding:
          const EdgeInsets.all(GeneralConstants.padding).copyWith(bottom: 40),
      itemBuilder: (_, index) => GestureDetector(
        onTap: () => context.router.push(ChoiceFragmentRoute(
          book: books[index],
          folders: folders,
        )),
        child: Container(
          padding: const EdgeInsets.all(13),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: theme.bordersPrimary)),
          child: Center(
            child: Text(
              books[index].bookName,
              style: theme.jura700x20.copyWith(color: theme.textPrimary),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: books.length,
    );
  }
}
