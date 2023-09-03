import 'package:bible_depth/feature/domain/entities/word_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ToolbarState extends Equatable {
  const ToolbarState();

  @override
  List<Object> get props => [];
}

class ToolbarLoadedState extends ToolbarState {}
