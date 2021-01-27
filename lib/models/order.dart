import 'package:kensa/models/vehicleOwner.dart';

class Order{
  String id;
  String idOwner;
  double status;
  String comment;
  VehicleOwner owner;
  Map<String, dynamic>orderDetails;
  Order.fromJson(Map<String, dynamic> parsedJson){
    try{
      id = parsedJson["id"];
      idOwner = parsedJson["idOwner"];
      status = double.parse(parsedJson["status"]);
      comment = parsedJson["comment"];
      orderDetails = parsedJson["orderDetails"];
      owner = VehicleOwner.fromJson(parsedJson["owner"]);
    }catch(e){

    }
  }
}