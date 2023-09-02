import 'package:bible_depth/features/bible_depth/domain/entities/fragment_entity.dart';

abstract class FragmentRepository {
  Future<FragmentEntity> getFragmentById(int id);
}
