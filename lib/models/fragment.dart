import 'package:bible_depth/models/wrap_entity.dart';

class Fragment {
  int id;
  List<WrapEntity> text;
  String name;

  Fragment({
    required this.id,
    required this.text,
    required this.name,
  });
}
