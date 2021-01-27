class VehicleOwner{
String id;
String name;
String phoneNumber;
String address;

  VehicleOwner.fromJson(Map<String, dynamic> parsedJson){
    try{
      id = parsedJson["id"];
      name = parsedJson["name"];
      phoneNumber = parsedJson["phoneNumber"];
      address = parsedJson["address"];
    }catch(e){
    }
  }
}