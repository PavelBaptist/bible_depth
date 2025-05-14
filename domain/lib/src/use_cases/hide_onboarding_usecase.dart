import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HideOnboardingUseCase {
  const HideOnboardingUseCase(this._startRepository);

  final StartRepository _startRepository;

  @protected
  Future<bool> call() async {
    await _startRepository.hideOnboarding();
    return true;
  }
}
