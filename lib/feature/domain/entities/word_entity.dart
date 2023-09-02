import 'package:equatable/equatable.dart';

class WordEntity extends Equatable {
  String value;
  String? color;
  WordEntity({required this.value, this.color});

  @override
  List<Object?> get props => [value, color];
}
