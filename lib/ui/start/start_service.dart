import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class StartService {
  StartService(
      {required HideOnboardingUseCase hideOnboardingUseCase,
      required FetchIsShowOnboardingUseCase fetchIsShowOnboardingUseCase})
      : _hideOnboardingUseCase = hideOnboardingUseCase,
        _fetchIsShowOnboardingUseCase = fetchIsShowOnboardingUseCase;

  final HideOnboardingUseCase _hideOnboardingUseCase;
  final FetchIsShowOnboardingUseCase _fetchIsShowOnboardingUseCase;

  Future<void> hideOnboarding() async {
    await _hideOnboardingUseCase();
  }

  Future<bool> get isShowOnboarding async {
    final result = await _fetchIsShowOnboardingUseCase();
    return result;
  }
}
