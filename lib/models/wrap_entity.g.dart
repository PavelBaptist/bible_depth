// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrap_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordAdapter extends TypeAdapter<Word> {
  @override
  final int typeId = 100;

  @override
  Word read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Word()
      ..value = fields[0] as String
      .._highlightColorHex = fields[1] as String?
      .._fontColorHex = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, Word obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj._highlightColorHex)
      ..writeByte(2)
      ..write(obj._fontColorHex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VerseIndexAdapter extends TypeAdapter<VerseIndex> {
  @override
  final int typeId = 101;

  @override
  VerseIndex read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VerseIndex()..value = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, VerseIndex obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerseIndexAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpaceAdapter extends TypeAdapter<Space> {
  @override
  final int typeId = 102;

  @override
  Space read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Space()..value = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Space obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpaceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LineBreakAdapter extends TypeAdapter<LineBreak> {
  @override
  final int typeId = 103;

  @override
  LineBreak read(BinaryReader reader) {
    return LineBreak();
  }

  @override
  void write(BinaryWriter writer, LineBreak obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LineBreakAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}