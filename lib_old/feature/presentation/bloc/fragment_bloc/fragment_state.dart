import 'package:bible_depth/feature/domain/entities/fragment_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FragmentState extends Equatable {
  const FragmentState();

  @override
  List<Object> get props => [];
}

class FragmentLoadingState extends FragmentState {}

class FragmentLoadedState extends FragmentState {
  final FragmentEntity fragmentEntity;
  FragmentLoadedState({required this.fragmentEntity});

  @override
  List<Object> get props => [fragmentEntity];
}
