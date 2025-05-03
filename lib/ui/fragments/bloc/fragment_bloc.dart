import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
part 'fragment_event.dart';
part 'fragment_state.dart';

class FragmentBloc extends Bloc<FragmentEvent, FragmentState> {
  FragmentBloc({required this.idFolder}) : super(FragmentLoading()) {
    on<FragmentInitEvent>(_init);
    on<FragmentloadEvent>(_page);
  }

  final int idFolder;
  late MainService _mainService;
  StreamSubscription? _subscription;

  Future<void> _init(
      FragmentInitEvent event, Emitter<FragmentState> emit) async {
    _mainService = GetIt.instance.get<MainService>();
    _subscription?.cancel();

    await Future.delayed(const Duration(seconds: 1));

    await _mainService.fetchFragments(idFolder).then((either) async {
      await either.fold(
        (failure) {},
        (stream) async {
          _subscription = stream.listen((fragments) {
            add(FragmentloadEvent(fragments: fragments));
          }, onError: (error) {});
        },
      );
    });
  }

  Future<void> _page(
      FragmentloadEvent event, Emitter<FragmentState> emit) async {
    emit(FragmentLoaded(
      fragments: event.fragments,
    ));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
