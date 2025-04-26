import 'package:path_provider/path_provider.dart';
import 'package:data/objectbox.g.dart';
// import 'package:objectbox_inspector/objectbox_inspector.dart';

Future<Store> openSharedStore() async {
  final dir = await getApplicationDocumentsDirectory();
  return await openStore(directory: dir.path);
}
