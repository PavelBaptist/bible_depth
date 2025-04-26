part of 'main_page_bloc.dart';

@immutable
sealed class MainPageEvent extends Equatable {}

final class MainPageInitEvent extends MainPageEvent {
  @override
  List<Object?> get props => [];
}

final class MainPageloadEvent extends MainPageEvent {
  final List<Folder> folders;

  MainPageloadEvent({required this.folders});

  @override
  List<Object?> get props => [];
}
