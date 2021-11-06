

class Test {
  PickUpLocation pickUpLocation;
  PickUpLocation dropOffLocation;

  Test({this.pickUpLocation, this.dropOffLocation});

  Test.fromJson(Map<String, dynamic> json) {
    pickUpLocation = json['pickUpLocation'] != null
        ?  PickUpLocation.fromJson(json['pickUpLocation'])
        : null;
    dropOffLocation = json['dropOffLocation'] != null
        ?  PickUpLocation.fromJson(json['dropOffLocation'])
        : null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (pickUpLocation != null) {
      data['pickUpLocation'] = pickUpLocation.toJson() ;
    }
    if (dropOffLocation != null) {
      data['dropOffLocation'] = dropOffLocation.toJson() ;
    }
    return data;
  }


}

class PickUpLocation {
  double lat;
  double lng;

  PickUpLocation({this.lat, this.lng});

  PickUpLocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['lat'] = this.lat as double;
    data['lng'] = this.lng as double;
    return data;
  }
}
