import 'package:flutter/material.dart';
import 'package:kensa/generated/i10n.dart';
import 'package:kensa/models/order.dart';
import 'package:kensa/widgets/itemOrderProcessing.dart';

class OrderProcessing extends StatefulWidget {
  final List<Order> orderProcessing;
  OrderProcessing(this.orderProcessing);
  @override
  _OrderProcessingState createState() => _OrderProcessingState();
}

class _OrderProcessingState extends State<OrderProcessing> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  widget.orderProcessing.isNotEmpty?ListView.builder(
        shrinkWrap: true,
        itemCount: widget.orderProcessing.length,
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
              ItemOrderProcessing(widget.orderProcessing[index]),
            ],
          );
        }
    ):Container();
  }
}
