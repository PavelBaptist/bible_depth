import 'package:bible_depth/feature/domain/entities/fragment_entity.dart';

abstract class FragmentRepository {
  Future<FragmentEntity> getFragmentById(int id);
}
