import 'package:bible_depth/feature/domain/entities/word_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ToolbarState extends Equatable {
  const ToolbarState();

  @override
  List<Object> get props => [];
}

class ToolbarLoadedState extends ToolbarState {}

class ToolbarSelectedToolState extends ToolbarState {
  Color? currentTool;
  ToolbarSelectedToolState({required this.currentTool});

  @override
  List<Object> get props => [currentTool ?? 0];
}
