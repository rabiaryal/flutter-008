import 'package:hive/hive.dart' show BinaryReader, BinaryWriter, HiveField, HiveObject, HiveType, TypeAdapter;

part 'user.g.dart'; // This file will be generated by Hive

@HiveType(typeId: 0) // Unique ID for this type
class User extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String phnNumber;


  @HiveField(2)
  final String email;

  @HiveField(3)
  final String address;

  User(this.name, this.email, this.address, this.phnNumber);
}
