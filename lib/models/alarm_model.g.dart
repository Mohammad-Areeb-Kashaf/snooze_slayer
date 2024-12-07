// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmAdapter extends TypeAdapter<Alarm> {
  @override
  final int typeId = 0;

  @override
  Alarm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alarm(
      label: fields[0] as String?,
      time: fields[1] as String?,
      repeat: (fields[4] as List?)?.cast<String>(),
      missions: (fields[5] as List?)?.cast<String>(),
      enabled: fields[6] as bool,
      snooze: fields[7] as Snooze?,
    )
      ..daysShort = (fields[2] as List).cast<String>()
      ..days = (fields[3] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, Alarm obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.daysShort)
      ..writeByte(3)
      ..write(obj.days)
      ..writeByte(4)
      ..write(obj.repeat)
      ..writeByte(5)
      ..write(obj.missions)
      ..writeByte(6)
      ..write(obj.enabled)
      ..writeByte(7)
      ..write(obj.snooze);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SnoozeAdapter extends TypeAdapter<Snooze> {
  @override
  final int typeId = 1;

  @override
  Snooze read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Snooze(
      minutes: fields[0] as int,
      times: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Snooze obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.minutes)
      ..writeByte(1)
      ..write(obj.times);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SnoozeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
