
import 'package:flutter/material.dart';
import 'package:cpza/addRecords.dart';
import 'package:cpza/common.dart';
import 'package:cpza/login.dart';
import 'package:cpza/viewRecords.dart';

class Dashboard extends StatefulWidget {
  String tocken;
  String fullname;
  Dashboard(this.tocken,this.fullname);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage('assets/images/user.png'),
                            radius: 40,
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Text(widget.fullname,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Container(
                                  height: MediaQuery.of(context)
                                      .size
                                      .height *
                                      0.05,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width *
                                      0.45,
                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius:
                                    BorderRadius.circular(16),
                                  ),
                                  child: FlatButton(
                                    onPressed:()=>_dialogue(context),
                                    child: Text(
                                      'Log Out',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  )),




                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  height: MediaQuery.of(context)
                      .size
                      .height *
                      0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    elevation: 10,
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddRecords(widget.tocken,widget.fullname)),
                        );


                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [

                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/icon_add_customer.jpg'),
                              radius: 30,
                            ),
                            SizedBox(height: 10,),

                            Text('Add Records',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),


                          ],
                        ),
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: MediaQuery.of(context)
                      .size
                      .height *
                      0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    elevation: 10,
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewRecords(widget.tocken,widget.fullname)),
                        );



                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [

                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/icon_customer_list.png'),
                              radius: 30,
                            ),
                            SizedBox(height: 10,),

                            Text('View Records',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),


                          ],
                        ),
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 20,),
              ],

            ),
          ),

        ],

      ),
    );
  }
  void _dialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Are you sure to Logout?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    Common.saveSharedPref("Logout","success");
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) =>
                                Login()),
                            (Route<dynamic> route) => false);

                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'))
            ],
          );
        });
  }
}
