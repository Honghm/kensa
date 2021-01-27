import 'package:flutter/material.dart';
import 'package:kensa/generated/i10n.dart';
import 'package:kensa/models/order.dart';
import 'package:kensa/screen/listCheckScreen.dart';


class OrderNew extends StatefulWidget {
  final List<Order> orderNew;
  OrderNew( this.orderNew);

  @override
  _OrderNewState createState() => _OrderNewState();
}

class _OrderNewState extends State<OrderNew> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.orderNew.isNotEmpty?ListView.builder (
        itemCount: widget.orderNew.length,

        itemBuilder: (context, index){
          return Column(
            children: [
              if(index==0)
                Container(
                  height: 36,
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,  color: Colors.black38,)
                  ),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black,),
                        labelText: S.of(context).search
                    ),
                  ),
                ),
              cardOrderNew(widget.orderNew[index], context),
            ],
          );
        }):Container();
  }
  Widget cardOrderNew(Order order, BuildContext context){
    return Card(
      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                            text:order.owner.name,
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
                            text:order.owner.phoneNumber,
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
                            text:order.owner.address,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 17,
                  ),
                  Text("${S.of(context).waiting}...",
                    style: TextStyle(color: Colors.white),),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: 90,
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context,   MaterialPageRoute(
                            builder: (context) => ListCheck(order)
                        ));
                      },
                      color: Color(0xFF83A603),
                      child: Text("${S.of(context).goCheck}",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white)
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      onPressed: (){},
                      child: Text("${S.of(context).refuse}",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

