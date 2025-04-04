import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FetchIsShowOnboardingUseCase {
  const FetchIsShowOnboardingUseCase(this._startRepository);

  final StartRepository _startRepository;

  @protected
  Future<bool> call() async {
    return _startRepository.fetchIsShowOnboarding();
  }
}
