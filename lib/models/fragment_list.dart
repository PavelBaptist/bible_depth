import 'package:bible_depth/models/fragment.dart';
import 'package:hive/hive.dart';
part 'fragment_list.g.dart';

@HiveType(typeId: 1)
class FragmentList {
  @HiveField(0)
  List<Fragment> list = [];
  FragmentList();
}
