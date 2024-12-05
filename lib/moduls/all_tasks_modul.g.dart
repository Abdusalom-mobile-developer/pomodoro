// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_tasks_modul.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllTasksModulAdapter extends TypeAdapter<AllTasksModul> {
  @override
  final int typeId = 0;

  @override
  AllTasksModul read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllTasksModul(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AllTasksModul obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.task)
      ..writeByte(1)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllTasksModulAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
