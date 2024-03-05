// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_style_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordStyleListAdapter extends TypeAdapter<WordStyleList> {
  @override
  final int typeId = 2;

  @override
  WordStyleList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordStyleList()..list = (fields[0] as List).cast<WordStyle>();
  }

  @override
  void write(BinaryWriter writer, WordStyleList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordStyleListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
