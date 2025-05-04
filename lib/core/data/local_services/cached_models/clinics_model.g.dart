// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinics_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClinicAdapter extends TypeAdapter<Clinic> {
  @override
  final int typeId = 0;

  @override
  Clinic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Clinic(
      id: fields[0] as int,
      address: fields[1] as String,
      phoneNumber: fields[2] as String,
      licenseDoc: fields[3] as String,
      isApproved: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Clinic obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.licenseDoc)
      ..writeByte(4)
      ..write(obj.isApproved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClinicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
