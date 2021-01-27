import 'package:flutter/material.dart';
import 'package:kensa/generated/i10n.dart';
import 'package:kensa/models/order.dart';


class ItemOrderProcessing extends StatefulWidget {
  final Order order;
  ItemOrderProcessing(this.order);
  @override
  _ItemOrderProcessingState createState() => _ItemOrderProcessingState();
}

class _ItemOrderProcessingState extends State<ItemOrderProcessing> {
  double _height = 120;
  bool isTap = false;
   _updateState(){
    setState(() {
      isTap = !isTap;
      _height = isTap?620:120;
    });
  }
  @override
  Widget build(BuildContext context) {
    return   AnimatedContainer(
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.only(left: 8,right: 8,bottom: 8),
      height: _height,
      child: Column(
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
                      colors: [Color(0xFF363639), Color(0xFF000000)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
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
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                  text:widget.order.owner.name,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
                                )
                              ]
                          ),
                        ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text: "${S.of(context).phoneVehicleOwner}: ",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                  text:widget.order.owner.phoneNumber,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
                                )
                              ]
                          ),
                        ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text: "${S.of(context).addressVehicleOwner}: ",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                  text:widget.order.owner.address,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 17,
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Text("${S.of(context).waiting}...",
                            style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          isTap? Expanded(
            child: Container(
              height: _height-120,
              child: Column(
                children: [
                  ///Thông tin
                  itemListCheck(S.of(context).information, 1, 0),

                  ///Giấy tờ xe
                  itemListCheck(S.of(context).vehicleDocument, 1, 0),

                  ///Chi tiết quan trọng 1
                  itemListCheck("A1. ${S.of(context).importantDetails}", 2, 0),

                  ///Chi tiết quan trọng 2
                  itemListCheck("A2. ${S.of(context).importantDetails}", 7, 0),

                  ///Đối với dòng xe SH Ý
                  itemListCheck("A*${S.of(context).forItalianSH}*", 2, 0),

                  ///Số khung số máy
                  itemListCheck("B. ${S.of(context).chassisNumber}, ${S.of(context).engineNumber}", 3, 0),

                  ///Điện, Fi, Cảm biến
                  itemListCheck("C. ${S.of(context).electricity}, ${S.of(context).fi}, ${S.of(context).sensors}", 9, 0),

                  ///Chạy thử
                  itemListCheck("D. ${S.of(context).takeATest}", 6, 0),

                  ///Chi tiết phụ
                  itemListCheck("E. ${S.of(context).additionalDetails}", 6, 0),

                  ///Chi tiết khác
                  itemListCheck("F. ${S.of(context).anotherDetails}", 3, 0),

                ],
              ),
            ),
          ):Container()
        ],
      ),
    );
  }
  Widget itemListCheck(name, quantityCheck, quantityChecked){
     return Expanded(
       child: Container(
         height: 40,
         margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
         color: Color(0xFFF5F5F5),
         child: ListTile(
           onTap: (){

           },

           leading: Text(name.toString(),style: TextStyle(fontSize: 14),),
           title: Text("${quantityChecked.toString()}/${quantityCheck.toString()}",style: TextStyle(fontSize: 14),textAlign: TextAlign.end,),
           trailing:Container(
             width: 50,
             child: Row(
               children: [
                 Icon(Icons.chevron_right, color: Colors.black,),
                 Icon(Icons.check_circle, color: quantityCheck==quantityChecked?Color(0xFF83A603):Color(0xFFF8CC37),)
               ],
             ),
           )
         ),
       ),
     );
  }
}
