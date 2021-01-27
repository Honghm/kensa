import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kensa/common/constants/colors.dart';
import 'package:kensa/generated/i10n.dart';
import 'package:kensa/models/order.dart';


class ItemOrderCompleted extends StatefulWidget {
  final Order order;
  ItemOrderCompleted(this.order);
  @override
  _ItemOrderCompletedState createState() => _ItemOrderCompletedState();
}

class _ItemOrderCompletedState extends State<ItemOrderCompleted> {
  double _height = 120;
  bool isTap = false;
  _updateState(){
    setState(() {
      isTap = !isTap;
      _height = isTap?480:120;

    });
  }
  @override
  Widget build(BuildContext context) {
    return   AnimatedContainer(
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.only(left: 8,right: 8,bottom: 8),
      height: _height,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              InkWell(
                onTap: (){
                  _updateState();
                },
                child: Container(
                  height: 120,
                  padding: EdgeInsets.only(left: 16,right: 16),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: isTap?[ Color(0xFFF8CC37),Color(0xFFF8CC37)]:[
                            Color(0xFF363639),
                            Color(0xFF000000),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: isTap?MediaQuery.of(context).size.width-50:MediaQuery.of(context).size.width - 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: "${S.of(context).nameVehicleOwner}: ",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isTap?Colors.black:Colors.white),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:widget.order.owner.name,
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: isTap?Colors.black:Colors.white),
                                    )
                                  ]
                              ),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: "${S.of(context).phoneVehicleOwner}: ",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isTap?Colors.black:Colors.white),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:widget.order.owner.phoneNumber,
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: isTap?Colors.black:Colors.white),
                                    )
                                  ]
                              ),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: "${S.of(context).addressVehicleOwner}: ",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isTap?Colors.black:Colors.white),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:widget.order.owner.address,
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: isTap?Colors.black:Colors.white),
                                    )
                                  ]
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                      ),
                      if(isTap==false)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(
                              height: 17,
                            ),
                            InkWell(
                              onTap: (){

                              },
                              child: Text(widget.order.comment,
                                style: TextStyle(color: Colors.white),),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                                height: 25,
                                width: 100,
                                child: RaisedButton(
                                  padding: EdgeInsets.only(left: 0),
                                  disabledColor: Colors.white70,
                                  color: Color(0xFFFFFFFF),
                                  child: Text("${S.of(context).finished}",textAlign:TextAlign.start,style: TextStyle(color: Color(0xFF83A603)),),
                                ),
                              ),
                          ],
                        )
                    ],
                  ),
                ),
              ),
              isTap? Expanded(
                child: Container(
                  height: 360,
                  width: MediaQuery.of(context).size.height,
                  color: kAmber,
                  child: Column(
                    children: [
                      Container(
                        height: 25,
                        width: 100,
                        margin: EdgeInsets.only(bottom: 15),
                        child: RaisedButton(
                          padding: EdgeInsets.only(left: 0),
                          disabledColor: Colors.white70,
                          color: Color(0xFFFFFFFF),
                          child: Text("${S.of(context).finished}",textAlign:TextAlign.start,style: TextStyle(color: Color(0xFF83A603)),),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: 330,
                          padding: EdgeInsets.only(left: 16,right: 16),
                          width: MediaQuery.of(context).size.height,
                          color: Colors.white,
                          margin: EdgeInsets.only(left: 8,right: 8,bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10,bottom: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.motorcycle_rounded,size: 30,color: Colors.black,),
                                          SizedBox(width: 8,),
                                          Text("Chi tiết",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                      Text(widget.order.comment,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                ),
                              ),

                              Expanded(
                                  child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text(widget.order.orderDetails["nameVehicle"],style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),)),

                                  Expanded(child: Text(widget.order.orderDetails["idVehicle"],style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),)),

                                ],
                              ),
                              ) ),
                              Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text("Ngày kiểm tra",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)),

                                    Expanded(child: Text(widget.order.orderDetails["dateCheck"],style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),)),

                                  ],
                                ),
                              )),

                              Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text("Giờ kiểm tra",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)),

                                    Expanded(child: Text(widget.order.orderDetails["timeCheck"],style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),)),

                                  ],
                                ),
                              )),

                              Expanded(
                                child: Container(

                                    margin: EdgeInsets.only(left: 40,top: 20),
                                    child: Text(widget.order.orderDetails["checker"],style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),)),
                              ),

                              Expanded(
                                child: Container(

                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Text("Tình trạng báo cáo",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                                      SizedBox(width: 8,),
                                      Icon(Icons.check_circle,color: widget.order.orderDetails["status"]?Color(0xFF83A603):Color(0xFFF8CC37),)
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ):Container()
            ],
          ),
          Icon(isTap?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down, color: isTap?Colors.black:Colors.white,),
        ],
      ),
    );
  }
}
