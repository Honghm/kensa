import 'package:flutter/material.dart';
import 'package:kensa/generated/i10n.dart';
import 'package:kensa/providers/order_provider.dart';
import 'package:kensa/screen/home.dart';
import 'package:kensa/widgets/staggerAnimation.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  with TickerProviderStateMixin{
  AnimationController _loginButtonController;
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  bool saveLogin = true;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginButtonController = AnimationController(duration: const Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loginButtonController.dispose();
  }
  Future<Null> _playAnimation() async {
    try {
      setState(() {
        isLoading = true;
      });
      await _loginButtonController.forward();
    } on TickerCanceled {

    }
  }

  Future<Null> _stopAnimation() async {
    try {
      await _loginButtonController.reverse();
      setState(() {
        isLoading = false;
      });
    } on TickerCanceled {

    }
  }
  _login(context) async {
    await _playAnimation();
    await Future.delayed(Duration(milliseconds: 500));
    _stopAnimation();
      Navigator.push(context,   MaterialPageRoute(
              builder: (context) => HomeScreen()
          ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 17,right: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60,),
                    Text(S.of(context).hello,style: TextStyle(fontSize: 40,fontWeight: FontWeight.normal),),
                    SizedBox(height: 40,),
                    Text(S.of(context).login, style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                  ],
                ),
              ),

              ///Nhập số điện thoại
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black38)
                ),
                child: TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16),
                    labelText:S.of(context).phoneNumber,
                    labelStyle: TextStyle(fontSize: 16),

                  ),
                ),
              ),
              SizedBox(height: 15,),

              ///Nhập mật khẩu
              Container(
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.black38)
                ),
                child: TextFormField(
                  controller: _passWordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16),
                    labelText:S.of(context).password,
                    labelStyle: TextStyle(fontSize: 16),

                  ),
                ),
              ),

              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Ghi nhớ đăng nhập
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          icon: saveLogin?Icon(Icons.check_circle,color: Theme.of(context).buttonColor,)
                              :Icon(Icons.check_circle_outline,color: Theme.of(context).buttonColor),
                          onPressed: (){
                            setState(() {
                              saveLogin = !saveLogin;
                            });
                      }),
                      Text(S.of(context).rememberLogin, style: TextStyle(fontSize: 16),)
                    ],
                  ),

                  ///Quên mật khẩu
                  InkWell(
                    onTap: (){

                    },
                    child: Text(S.of(context).forgotPassword, style: TextStyle(fontSize: 16),),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              StaggerAnimation(
                titleButton: S.of(context).loginCapitalization,
                buttonController: _loginButtonController.view,
                onTap: () {
                  if (!isLoading) {
                    _login(context);
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
