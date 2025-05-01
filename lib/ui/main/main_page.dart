import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    return BlocProvider(
      create: (context) => MainPageBloc()..add(MainPageInitEvent()),
      child:
          BlocBuilder<MainPageBloc, MainPageState>(builder: (context, state) {
        return Scaffold(
          floatingActionButton:
              (state is MainPageLoaded) && state.folders.isNotEmpty
                  ? ElevatedButton(
                      onPressed: () {
                        context.router
                            .push(ChoiceBookRoute(folders: state.folders));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: theme.backgroundPrimary,
                        padding: const EdgeInsets.all(16),
                        side: BorderSide(color: theme.textPrimary, width: 2),
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        size: 40,
                        color: theme.textPrimary,
                      ),
                    )
                  : null,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          appLocale.myAnalysis,
                          style: theme.jura700x36.copyWith(
                            color: theme.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              state is MainPageLoaded
                  ? MainFolders(
                      folders: state.folders,
                    )
                  : const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 100.0),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
            ],
          ),
        );
      }),
    );
  }
}

class MainFolders extends StatelessWidget {
  const MainFolders({super.key, required this.folders});

  final List<Folder> folders;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    return folders.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(GeneralConstants.padding)
                  .copyWith(bottom: 200),
              itemBuilder: (_, index) => GestureDetector(
                onTap: () =>
                    context.router.push(FragmentRoute(folder: folders[index])),
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
                    folders[index].name,
                    style: theme.jura700x32.copyWith(color: theme.textWhite),
                  ),
                ),
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: folders.length,
            ),
          )
        : Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      appLocale.emptyFolder,
                      style:
                          theme.jura700x16.copyWith(color: theme.textPrimary),
                    ),
                    const SizedBox(height: 8),
                    CustomButton(
                      onPressed: () {
                        context.router.push(ChoiceBookRoute(folders: folders));
                      },
                      title: appLocale.addAnalysis,
                      infinity: false,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
