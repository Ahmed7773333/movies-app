// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchListDBAdapter extends TypeAdapter<WatchListDB> {
  @override
  final int typeId = 0;

  @override
  WatchListDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchListDB(
      image: fields[0] as String,
      title: fields[1] as String,
      date: fields[2] as String,
      path: fields[3] as String,
      details: fields[4] as String,
      isBooked: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WatchListDB obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.path)
      ..writeByte(4)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchListDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
