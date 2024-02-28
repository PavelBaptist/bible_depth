import 'package:bible_depth/core/usecases/usecase.dart';
import 'package:bible_depth/feature/domain/entities/fragment_entity.dart';
import 'package:bible_depth/feature/domain/repositories/fragment_repository.dart';

class GetFragmentById
    implements UseCase<FragmentEntity, GetFragmentByIdParams> {
  final FragmentRepository fragmentRepository;

  GetFragmentById({required this.fragmentRepository});

  @override
  Future<FragmentEntity> call(GetFragmentByIdParams params) async {
    return fragmentRepository.getFragmentById(params.id);
  }
}

class GetFragmentByIdParams {
  final int id;

  GetFragmentByIdParams({required this.id});
}
