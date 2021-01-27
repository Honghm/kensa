import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kensa/common/constants/colors.dart';
import 'package:kensa/generated/i10n.dart';
import 'package:kensa/models/appModel.dart';
import 'package:kensa/models/order.dart';
import 'package:provider/provider.dart';

class ThongTin extends StatefulWidget {
  final Order order;
  Function setFinish;
  ThongTin(this.order,this.setFinish);
  @override
  _ThongTinState createState() => _ThongTinState();
}

class _ThongTinState extends State<ThongTin> {
  List<Widget> listImage = [];
  File _image;

  String drdManufacturerValue = "Honda";
  String drdVehicleLineValue = "SH Mode";
  String drdYearManufactureValue = "2020";
  String drdEngineTypeValue = "150cc";

  TextEditingController nameOwnerController = TextEditingController();
  TextEditingController phoneOwnerController = TextEditingController();
  TextEditingController addressOwnerController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController kmController = TextEditingController();
  TextEditingController idVehicleController = TextEditingController();

  getImageSuccess(File image){
    if(image!=null){
      setState(() {
        _image = image;
      });
    }

  }
  showListImage(){
    listImage.clear();
    listImage.add(selectImage());
    listImage.add(selectImage());
    listImage.add(selectImage());
    return listImage;
  }
  @override
  Widget build(BuildContext context) {
    AppModel appModel = Provider.of<AppModel>(context);
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
              margin: EdgeInsets.only(left: 16,top: 16,right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Thông tin khách hàng", style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w300),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         height: 70,
                         width: 160,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Tên khách hàng",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                             TextFormField(
                               //controller: nameOwnerController,
                               initialValue: widget.order.owner.name,
                               // decoration: InputDecoration(
                               //   labelText: widget.order.owner.name,
                               //     labelStyle: TextStyle(fontSize: 14, color: Colors.black)
                               // ),

                             )
                           ],
                         ),
                       ),
                       Container(
                         height: 70,
                         width: 160,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Số điện thoại",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                             TextFormField(
                               //controller: phoneOwnerController,
                               initialValue:  widget.order.owner.phoneNumber,
                               // decoration: InputDecoration(
                               //     labelText: widget.order.owner.phoneNumber,
                               //     labelStyle: TextStyle(fontSize: 14, color: Colors.black)
                               // ),
                             )
                           ],
                         ),
                       )
                     ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Địa chỉ kiểm tra",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                          TextFormField(
                            //controller: addressOwnerController,
                            initialValue: widget.order.owner.address,
                            decoration: InputDecoration(
                              //   labelText: widget.order.owner.address,
                              // labelStyle: TextStyle(fontSize: 14, color: Colors.black)
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 16,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black38)
                  )
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Text("Thông tin xe", style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w300),),
                    ),
                    Container(
                      height: 250,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 250,
                                height: 180,
                                child: Container(
                                  height: 150,
                                  width: 200,
                                  margin: EdgeInsets.only(top: 20,bottom: 15,left: 70),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(color: Colors.black38)
                                  ),
                                  child: IconButton(
                                    onPressed: (){
                                      appModel.showPicker(context: context, success: getImageSuccess);
                                    },
                                    icon: Icon(Icons.camera_alt_outlined,size: 50,color: Colors.black,),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 230,right: 50),
                                  child: IconButton(icon: Icon(Icons.cancel,color: Colors.black,), onPressed: (){}))
                            ],
                          ),
                          Container(
                            height: 56,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            color: Colors.black,
                            child: Text(widget.order.orderDetails["nameVehicle"],
                              style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 65,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hãng xe",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                              Container(
                                height: 50,
                                width: 160,
                                child:  DropdownButton<String>(
                                  value: drdManufacturerValue,
                                  isExpanded: true,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  style: TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      drdManufacturerValue = newValue;
                                    });
                                  },
                                  items: <String>['Honda', 'Honda1', 'Honda2', 'Honda3']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 65,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dòng xe",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                              Container(
                                height: 50,
                                width: 160,
                                child:  DropdownButton<String>(
                                  value: drdVehicleLineValue,
                                  isExpanded: true,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  style: TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      drdVehicleLineValue = newValue;
                                    });
                                  },
                                  items: <String>['SH Mode', 'SH Mode 1', 'SH Mode 2', 'SH Mode 3']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 65,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Năm SX*",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                              Container(
                                height: 50,
                                width: 160,
                                child:  DropdownButton<String>(
                                  value: drdYearManufactureValue,
                                  isExpanded: true,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  style: TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      drdYearManufactureValue = newValue;
                                    });
                                  },
                                  items: <String>['2018', '2019', '2020', '2021']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 65,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Động cơ CC*",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                              Container(
                                height: 50,
                                width: 160,
                                child:  DropdownButton<String>(
                                  value: drdEngineTypeValue,
                                  isExpanded: true,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  style: TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      drdEngineTypeValue = newValue;
                                    });
                                  },
                                  items: <String>['50cc', '100cc', '120cc', '150cc']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 65,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Số khung/Số máy*",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                              TextFormField(
                                controller: numberController,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 65,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Số KM đã đi*",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                              TextFormField(
                                controller: kmController,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 65,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Biển số xe*",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                              TextFormField(
                                controller: idVehicleController,
                              )
                            ],
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
              Container(
                height: 16,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black38)
                    )
                ),
              ),
              Container(
                height: 130,
                margin: EdgeInsets.only(left: 16,top: 16,right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Chụp thêm ảnh xe",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 16,),
                    Text("*Tải lên ít nhất 1 ảnh của xe",style: TextStyle(fontSize: 12, color: Colors.black38,fontWeight: FontWeight.normal),),

                    Container(
                      height: 70,
                      child: Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: IconButton(
                              onPressed: (){
                                appModel.showPicker(context: context, success: getImageSuccess);
                              },
                              icon: Icon(Icons.camera_alt_outlined,color: Colors.black,size: 30,),),
                          ),
                          SizedBox(width: 10,),
                         Row(children: showListImage(),)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 16,right: 16,bottom: 20),
                child: RaisedButton(
                  color: Color(0xFFF8CC37),
                  onPressed: (){
                    widget.setFinish(true,1);
                    Navigator.pop(context);
                  },
                  child: Text("HOÀN TẤT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget selectImage(){
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15),
          child: Container(
            height: 55,
            width: 65,

            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 30,bottom: 30),
            child: IconButton(icon: Icon(Icons.cancel,color: Colors.black,), onPressed: (){})),


      ],
    );
  }
}
