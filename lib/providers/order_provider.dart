

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kensa/data/data.dart';
import 'package:kensa/models/order.dart';


class OrderProvider with ChangeNotifier{
  List<Order> orderNew = [];
  List<Order> ordersProcessing = [];
  List<Order> orderCompleted = [];
  List<Order> oderDeclinedCheck = [];

Future<void> getOrder () async {
  try{
    if(data["orders"]!=null){
      data["orders"].forEach((item){
        switch(item["status"]){
          case "0":
            orderNew.add(Order.fromJson(item));
            break;
          case "1":
            ordersProcessing.add(Order.fromJson(item));
            break;
          case "2":
            orderCompleted.add(Order.fromJson(item));
            break;
          case "3":
            oderDeclinedCheck.add(Order.fromJson(item));
            break;
        }
      });
    }
  }catch(e){

  }

}
}