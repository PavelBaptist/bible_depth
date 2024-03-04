// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_style.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordStyleAdapter extends TypeAdapter<WordStyle> {
  @override
  final int typeId = 200;

  @override
  WordStyle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordStyle()
      ..description = fields[0] as String
      ..id = fields[1] as String
      .._fontColor = fields[2] as String?
      ..isBold = fields[3] as bool?
      ..isItalic = fields[4] as bool?
      .._borderColor = fields[5] as String?
      ..borderIsCircle = fields[6] as bool
      ..image = fields[7] as String?
      ..stretchImage = fields[8] as bool?
      .._highlightColor = fields[9] as String?;
  }

  @override
  void write(BinaryWriter writer, WordStyle obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj._fontColor)
      ..writeByte(3)
      ..write(obj.isBold)
      ..writeByte(4)
      ..write(obj.isItalic)
      ..writeByte(5)
      ..write(obj._borderColor)
      ..writeByte(6)
      ..write(obj.borderIsCircle)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.stretchImage)
      ..writeByte(9)
      ..write(obj._highlightColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordStyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
