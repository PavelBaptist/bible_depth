import 'package:bible_depth/features/bible_depth/data/datasources/fragment_mock_data_source.dart';
import 'package:bible_depth/features/bible_depth/domain/entities/fragment_entity.dart';
import 'package:bible_depth/features/bible_depth/domain/repositories/fragment_repository.dart';

class FragmentRepositoryImpl implements FragmentRepository {
  final FragmentMockDataSource fragmentMockDataSource;

  FragmentRepositoryImpl({required this.fragmentMockDataSource});

  @override
  Future<FragmentEntity> getFragmentById(int id) async {
    return await fragmentMockDataSource.getById(id);
  }
}
