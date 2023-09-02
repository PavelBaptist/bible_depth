import 'package:equatable/equatable.dart';

class FragmentEntity extends Equatable {
  int id;
  List<String> text;
  String name;

  FragmentEntity({
    required this.id,
    required this.text,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        name,
      ];
}
