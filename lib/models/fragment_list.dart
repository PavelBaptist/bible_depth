import 'package:bible_depth/models/fragment.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'fragment_list.g.dart';

@HiveType(typeId: 1)
class FragmentList {
  @HiveField(0)
  List<Fragment> list = [];
  FragmentList();
}
