import 'package:flutter/material.dart';
import 'package:kensa/common/constants/colors.dart';
import 'package:kensa/generated/i10n.dart';
import 'package:kensa/models/order.dart';
import 'package:kensa/screen/thongTinScreen.dart';

class ListCheck extends StatefulWidget {
  final Order order;
  ListCheck(this.order);

  @override
  _ListCheckState createState() => _ListCheckState();
}

class _ListCheckState extends State<ListCheck> {
  bool isFinish = false;
  int kindCheck = 0;
  setFinish(bool result, int kind){
  setState(() {
    isFinish = result;
    kindCheck = kind;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        title: Text(S.of(context).information, style: TextStyle(fontSize: 14, color: kTextDefault),),
        bottom: AppBar(
          leadingWidth: 80,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 10),
              width: 80,
              child: Row(
                children: [
                  Icon(Icons.arrow_back, size: 25, color: kTextDefault,),
                  Text(S.of(context).back, style: TextStyle(fontSize: 14, color: kTextDefault),)
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [

            ///Thông tin
            itemListCheck(
                name:S.of(context).information,
                quantityCheck: 1,
                quantityChecked: 0,
                kind:1,
                context:context,
              setFinish: setFinish,
              isFinish: isFinish==true&&kindCheck==1?true:false
            ),

            ///Giấy tờ xe
            itemListCheck(
                name:S.of(context).vehicleDocument,
                quantityCheck: 1,
                quantityChecked: 0,
                kind:2,
                context:context),

            ///Chi tiết quan trọng 1
            itemListCheck(
                name:"A1. ${S.of(context).importantDetails}",
                quantityCheck: 2,
                quantityChecked: 0,
                kind:3,
                context:context),
            ///Chi tiết quan trọng 2
            itemListCheck(
                name:"A2. ${S.of(context).importantDetails}",
                quantityCheck: 7,
                quantityChecked: 0,
                kind:4,
                context:context),
            ///Đối với dòng xe SH Ý
            itemListCheck(
                name:"A*${S.of(context).forItalianSH}*",
                quantityCheck: 2,
                quantityChecked: 0,
                kind:5,
                context:context),
            ///Số khung số máy
            itemListCheck(
                name:"B. ${S.of(context).chassisNumber}, ${S.of(context).engineNumber}",
                quantityCheck: 3,
                quantityChecked: 0,
                kind:6,
                context:context),
            ///Điện, Fi, Cảm biến
            itemListCheck(
                name:"C. ${S.of(context).electricity}, ${S.of(context).fi}, ${S.of(context).sensors}",
                quantityCheck: 9,
                quantityChecked: 0,
                kind:7,
                context:context),
            ///Chạy thử
            itemListCheck(
                name:"D. ${S.of(context).takeATest}",
                quantityCheck: 6,
                quantityChecked: 0,
                kind:8,
                context:context),
            ///Chi tiết phụ
            itemListCheck(
                name:"E. ${S.of(context).additionalDetails}",
                quantityCheck: 6,
                quantityChecked: 0,
                kind:9,
                context:context),
            ///Chi tiết khác
            itemListCheck(
                name:"F. ${S.of(context).anotherDetails}",
                quantityCheck: 3,
                quantityChecked: 0,
                kind:10,
                context:context),
          ],
        ),
      ),
    );
  }

  Widget itemListCheck({name, quantityCheck, quantityChecked, kind, BuildContext context, Function setFinish, bool isFinish}){

    return Container(
      height: 40,
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      color: Color(0xFFF5F5F5),
      child: ListTile(
          onTap: (){
            switch(kind){
              case 1:
                return Navigator.push(context,  MaterialPageRoute(
                    builder: (context) => ThongTin(widget.order,setFinish)
                ));
              case 2:
                return null;
              case 3:
                return null;
              case 4:
                return null;
              case 5:
                return null;
              case 6:
                return null;
              case 7:
                return null;
              case 8:
                return null;
              case 9:
                return null;
              case 10:
                return null;
            }
          },

          leading: Text(name.toString(),style: TextStyle(fontSize: 14),),
          title: Text("${quantityChecked.toString()}/${quantityCheck.toString()}",style: TextStyle(fontSize: 14),textAlign: TextAlign.end,),
          trailing:Container(
            width: 50,
            child: isFinish==true?Icon(Icons.check_circle, color: quantityCheck==quantityChecked?Color(0xFF83A603):Color(0xFFF8CC37),):Icon(Icons.chevron_right, color: Colors.black,),
          )
      ),
    );
  }
}
