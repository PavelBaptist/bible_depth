import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class FragmentLocal {
  FragmentLocal({
    this.id = 0,
    required this.name,
    required this.description,
    required this.bookId,
    required this.bookName,
  });

  @Id()
  int id;
  final String name;
  final text = ToMany<VerseLocal>();
  final String description;
  final int bookId;
  final String bookName;
}

extension FragmentMapper on Fragment {
  FragmentLocal toLocalFragment() {
    FragmentLocal fragment = FragmentLocal(
      id: id,
      name: name,
      description: description,
      bookId: bookId,
      bookName: bookName,
    );
    fragment.text.addAll(text.map((e) => e.toLocalVerse()).toList());
    return fragment;
  }
}

extension LocalFragmentDataMapper on FragmentLocal {
  Fragment toFragment() {
    return Fragment(
      id: id,
      name: name,
      text: text.map((e) => e.toVerse()).toList(),
      description: description,
      bookId: bookId,
      bookName: bookName,
    );
  }
}
