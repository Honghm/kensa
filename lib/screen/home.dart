
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kensa/common/constants/colors.dart';
import 'package:kensa/generated/i10n.dart';
import 'package:kensa/models/order.dart';
import 'package:kensa/providers/order_provider.dart';
import 'package:kensa/widgets/oderProcessing.dart';
import 'package:kensa/widgets/orderCompleted.dart';
import 'package:kensa/widgets/orderNew.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool haveNotifications = true;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: 4,initialIndex: 0);
   Provider.of<OrderProvider>(context,listen: false).getOrder();
   setState(() {

   });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  changeTab(int tabIndex){
    _tabController.index = tabIndex;
  }
  @override
  Widget build(BuildContext context) {
    OrderProvider orders = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
          },
        ),
        title: Text(S.of(context).vehicleAppraisal, style: TextStyle(color: Theme.of(context).primaryColor),),
        actions: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10),
            child: InkWell(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(Icons.notifications_none,color: Theme.of(context).buttonColor,size: 25,),
                  haveNotifications?Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius:BorderRadius.all(Radius.circular(3))
                  ),):Container()
                ],
              ),
            ),
          )
        ],

      ),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: kDarkBG,
          leading: Container(),
          leadingWidth: 1,
          title:  Container(
                alignment: Alignment.center,
                height: 56,
                color: Theme.of(context).colorScheme.primary,
                child: Text(S.of(context).memberCapitalization, style: TextStyle(fontSize: 16),),
              ),
          bottom: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: kAmber,
              labelStyle: TextStyle(color:  Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
              tabs: <Tab>[
                Tab(child: Container(
                  margin: EdgeInsets.only(top: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(orders.orderNew.isNotEmpty?"${orders.orderNew.length}":"0",style: TextStyle(color: kLightPrimary,fontSize: 14)),
                      Text(S.of(context).ordersNew,style: TextStyle(color: kLightPrimary,fontSize: 14),)
                    ],
                  ),
                ),),
                Tab(child: Container(
                  margin: EdgeInsets.only(top: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(orders.ordersProcessing.isNotEmpty?"${orders.ordersProcessing.length}":"0",style: TextStyle(color: kAmber,fontSize: 14)),
                      Container(
                          width: 60, height: 28,
                          child: Text(S.of(context).ordersProcessing,style: TextStyle(color: kLightPrimary,fontSize: 14),textAlign: TextAlign.center,))
                    ],
                  ),
                ),),
                Tab(child: Container(
                  margin: EdgeInsets.only(top: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(orders.orderCompleted.isNotEmpty?"${orders.orderCompleted.length}":"0",style: TextStyle(color: kGreen,fontSize: 14)),
                      Container(
                          width: 80, height: 28,
                          child: Text(S.of(context).orderCompleted,style: TextStyle(color: kLightPrimary,fontSize: 14),textAlign: TextAlign.center,))
                    ],
                  ),
                ),),
                Tab(child: Container(
                  margin: EdgeInsets.only(top: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(orders.oderDeclinedCheck.isNotEmpty?"${orders.oderDeclinedCheck.length}":"0",style: TextStyle(color: kErrorRed,fontSize: 14)),
                      Container(
                          width: 50, height: 28,
                          child: Text(S.of(context).oderDeclinedCheck,style: TextStyle(color: kLightPrimary,fontSize: 14),textAlign: TextAlign.center,))
                    ],
                  ),
                ),),
              ]
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            OrderNew(orders.orderNew),
            OrderProcessing(orders.ordersProcessing),
            OrderCompleted(orders.orderCompleted),
            Container(
              child: Text("Mới"),
            ),
          ],
        )
      ),

    );
  }
}
