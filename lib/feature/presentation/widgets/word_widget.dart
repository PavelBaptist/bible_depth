import 'package:bible_depth/feature/domain/entities/word_entity.dart';
import 'package:flutter/material.dart';

class WordWidget extends StatelessWidget {
  WordEntity wordEntity;
  WordWidget({super.key, required this.wordEntity});

  @override
  Widget build(BuildContext context) {
    return Text(wordEntity.value);
  }
}
