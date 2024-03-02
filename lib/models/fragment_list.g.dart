// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FragmentListAdapter extends TypeAdapter<FragmentList> {
  @override
  final int typeId = 1;

  @override
  FragmentList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FragmentList()..list = (fields[0] as List).cast<Fragment>();
  }

  @override
  void write(BinaryWriter writer, FragmentList obj) {
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
      other is FragmentListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
