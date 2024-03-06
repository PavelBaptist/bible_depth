// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structural_law.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StructuralLawAdapter extends TypeAdapter<StructuralLaw> {
  @override
  final int typeId = 201;

  @override
  StructuralLaw read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StructuralLaw()
      ..id = fields[0] as String
      ..isAssetsSource = fields[1] as bool
      ..image = fields[2] as String
      ..description = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, StructuralLaw obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isAssetsSource)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StructuralLawAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
