import 'dart:async';

import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageLoading()) {
    on<MainPageInitEvent>(_init);
    on<MainPageloadEvent>(_page);
  }

  late MainService _mainService;
  StreamSubscription? _subscription;

  Future<void> _init(
      MainPageInitEvent event, Emitter<MainPageState> emit) async {
    _mainService = GetIt.instance.get<MainService>();
    _subscription?.cancel();

    await Future.delayed(const Duration(seconds: 1));

    await _mainService.fetchAllFoldes().then((either) async {
      await either.fold(
        (failure) {},
        (stream) async {
          _subscription = stream.listen((folders) {
            add(MainPageloadEvent(folders: folders));
            // print(folders.first);
          }, onError: (error) {});
        },
      );
    });
  }

  Future<void> _page(
      MainPageloadEvent event, Emitter<MainPageState> emit) async {
    emit(MainPageLoaded(
      folders: event.folders,
    ));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
