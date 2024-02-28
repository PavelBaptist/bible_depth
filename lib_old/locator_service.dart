import 'package:bible_depth/feature/data/datasources/fragment_mock_data_source.dart';
import 'package:bible_depth/feature/data/repositories/fragment_repository_impl.dart';
import 'package:bible_depth/feature/domain/usecases/get_fragment_by_id.dart';
import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/toolbar_bloc/toolbar_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/words_bloc/words_bloc.dart';

import 'package:get_it/get_it.dart';

import 'feature/domain/repositories/fragment_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory<FragmentBloc>(
    () => FragmentBloc(getFragmentById: sl()),
  );
  sl.registerFactory<WordsBloc>(
    () => WordsBloc(),
  );
  sl.registerFactory<ToolbarBloc>(
    () => ToolbarBloc(),
  );

  // UseCases
  sl.registerLazySingleton(() => GetFragmentById(fragmentRepository: sl()));

  // Repository
  sl.registerLazySingleton<FragmentRepository>(
    () => FragmentRepositoryImpl(
      fragmentMockDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<FragmentMockDataSource>(
      () => FragmentMockDataSourceImpl());
}
