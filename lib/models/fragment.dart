import 'package:bible_depth/models/wrap_entity.dart';
import 'package:equatable/equatable.dart';

class Fragment extends Equatable {
  int id;
  List<WrapEntity> text;
  String name;

  Fragment({
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
