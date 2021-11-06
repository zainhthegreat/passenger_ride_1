import 'package:json_annotation/json_annotation.dart';
import 'package:passenger/schemas/location.dart';

part 'service.g.dart';

@JsonSerializable()
class Service
{
  Location pickUpLocation;
  Location dropOffLocation;

  Service(this.pickUpLocation,this.dropOffLocation);

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}