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
      ..styleId = fields[1] as String
      ..structuralLawId = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, Word obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.styleId)
      ..writeByte(2)
      ..write(obj.structuralLawId);
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

class LineBreakAdapter extends TypeAdapter<LineBreak> {
  @override
  final int typeId = 103;

  @override
  LineBreak read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LineBreak()..value = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, LineBreak obj) {
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
      other is LineBreakAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StructuralLawPlaceAdapter extends TypeAdapter<StructuralLawPlace> {
  @override
  final int typeId = 104;

  @override
  StructuralLawPlace read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StructuralLawPlace()
      ..value = fields[0] as String
      ..structuralLawId = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, StructuralLawPlace obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.structuralLawId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StructuralLawPlaceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HeaderAdapter extends TypeAdapter<Header> {
  @override
  final int typeId = 105;

  @override
  Header read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Header()
      ..value = fields[0] as String
      ..level = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, Header obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeaderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChapterIndexAdapter extends TypeAdapter<ChapterIndex> {
  @override
  final int typeId = 106;

  @override
  ChapterIndex read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterIndex()..value = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, ChapterIndex obj) {
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
      other is ChapterIndexAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
