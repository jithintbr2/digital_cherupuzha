
import 'package:flutter/material.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/common.dart';
import 'package:cpza/dashboard.dart';
import 'package:cpza/loginModel.dart';

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context)
                    .size
                    .height *
                    0.4,

                child: Padding(
                  padding: const EdgeInsets.only(left:10,right: 10),
                  child: Card(
                    elevation: 10,
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('Login', style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:20, right: 20,bottom: 10,top: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: username,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.phone_android),
                                  hintText: 'Enter Your Mobile Number',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: 'Enter Your Password',
                                ),
                              ),
                            ),
                          ),
                        ),
                        /* Text(
                                  'Forgot Password',
                                  style: TextStyle(color: Colors.black, fontSize: 15),
                                ),*/
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: FlatButton(
                              onPressed: () async {
                                if (username.text.isEmpty) {
                                  Common.toastMessaage(
                                      'Username cannot be empty', Colors.red);
                                } else if (password.text.isEmpty) {
                                  Common.toastMessaage(
                                      'Password cannot be empty', Colors.red);
                                } else {
                                  LoginModel object = await HttpService.login(
                                      username.text, password.text);

                                  if (object.status == true) {
                                    Common.saveSharedPref("tocken", object.data.token);
                                    Common.saveSharedPref("fullName", object.data.fullName);



                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Dashboard(object.data.token,object.data.fullName)),
                                    );

                                    Common.toastMessaage(
                                        'Login Success Please Wait', Colors.green);
                                  } else {
                                    Common.toastMessaage(
                                        'Invalid Username And Password', Colors.red);
                                  }
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],

      ),
    );
  }
}
