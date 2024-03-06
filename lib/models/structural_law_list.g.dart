// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structural_law_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StructuralLawListAdapter extends TypeAdapter<StructuralLawList> {
  @override
  final int typeId = 4;

  @override
  StructuralLawList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StructuralLawList()
      ..list = (fields[0] as List).cast<StructuralLaw>();
  }

  @override
  void write(BinaryWriter writer, StructuralLawList obj) {
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
      other is StructuralLawListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
