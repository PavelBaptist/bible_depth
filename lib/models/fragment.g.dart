// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FragmentAdapter extends TypeAdapter<Fragment> {
  @override
  final int typeId = 3;

  @override
  Fragment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fragment(
      text: (fields[1] as List).cast<WrapEntity>(),
      name: fields[0] as String,
    )
      ..description = fields[2] as String?
      ..bookId = fields[3] as int?
      ..structuralLawList = fields[4] as StructuralLawList?
      ..wordStyleList = fields[5] as WordStyleList?;
  }

  @override
  void write(BinaryWriter writer, Fragment obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.bookId)
      ..writeByte(4)
      ..write(obj.structuralLawList)
      ..writeByte(5)
      ..write(obj.wordStyleList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FragmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
