// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

import 'package:bible_depth/library.dart';

@RoutePage()
class FragmentPage extends StatelessWidget {
  const FragmentPage({
    Key? key,
    required this.folder,
  }) : super(key: key);

  final Folder folder;

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
    // final appLocale = S.of(context);
    return BlocProvider(
      create: (context) =>
          FragmentBloc(idFolder: folder.id)..add(FragmentInitEvent()),
      child:
          BlocBuilder<FragmentBloc, FragmentState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(folder.name)),
          body: state is FragmentLoaded
              ? FragmentsListWidget(
                  fragments: state.fragments,
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

class FragmentsListWidget extends StatelessWidget {
  const FragmentsListWidget({super.key, required this.fragments});

  final List<Fragment> fragments;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    // final appLocale = S.of(context);
    return fragments.isNotEmpty
        ? ListView.separated(
            padding: const EdgeInsets.all(GeneralConstants.padding)
                .copyWith(bottom: 200),
            itemBuilder: (_, index) => GestureDetector(
              onTap: () => context.router
                  .push(AnalysisRoute(fragment: fragments[index])),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [theme.beruz, theme.darkBeruz],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Text(
                  fragments[index].name,
                  style: theme.jura700x32.copyWith(color: theme.textWhite),
                ),
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: fragments.length,
          )
        : const SizedBox();
  }
}
