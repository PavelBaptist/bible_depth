part of 'main_page_bloc.dart';

@immutable
sealed class MainPageState extends Equatable {}

final class MainPageLoading extends MainPageState {
  @override
  List<Object?> get props => [];
}

final class MainPageLoaded extends MainPageState {
  final List<Folder> folders;

  MainPageLoaded({required this.folders});

  @override
  List<Object?> get props => [folders];
}
