

import 'package:json_annotation/json_annotation.dart';
import 'package:passenger/schemas/location.dart';

part 'fleets.g.dart';

@JsonSerializable()
class Fleets
{
   String selectedServiceTypeId;
   Location pickUpLocation;
   String estimatedFare;

  Fleets(this.selectedServiceTypeId,this.pickUpLocation,this.estimatedFare);
  factory Fleets.fromJson(Map<String, dynamic> json) => _$FleetsFromJson(json);
  Map<String, dynamic> toJson() => _$FleetsToJson(this);


}