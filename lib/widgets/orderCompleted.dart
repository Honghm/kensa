import 'package:flutter/material.dart';
import 'package:kensa/generated/i10n.dart';
import 'package:kensa/models/order.dart';
import 'package:kensa/widgets/itemOrderCompleted.dart';

class OrderCompleted extends StatefulWidget {
  final List<Order> orderCompleted;
  OrderCompleted(this.orderCompleted);
  @override
  _OrderCompletedState createState() => _OrderCompletedState();
}

class _OrderCompletedState extends State<OrderCompleted> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return widget.orderCompleted.isNotEmpty?ListView.builder(
        shrinkWrap: true,
        itemCount: widget.orderCompleted.length,
        itemBuilder: (value, index){
          return  Column(
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
              ItemOrderCompleted(widget.orderCompleted[index]),
            ],
          );
        }
    ):Container();
  }
}
