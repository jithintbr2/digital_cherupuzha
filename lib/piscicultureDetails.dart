
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addAnimalHusbandaryDetails.dart';
import 'package:cpza/addPiscicultureDetails.dart';
import 'package:cpza/memberDetails.dart';
import 'package:cpza/piscicultureDetailsModel.dart';

class PiscicultureDetails extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;
  PiscicultureDetails(this.masterHeadId,this.token,this.fullName);

  @override
  _PiscicultureDetailsState createState() => _PiscicultureDetailsState();
}

class _PiscicultureDetailsState extends State<PiscicultureDetails> {
  PiscicultureDetailsModel details;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    details = await HttpService.piscicultureDetails(widget.masterHeadId,widget.token);

    if(details!=null)
    {
      setState(() {

      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => memberDetails(widget.masterHeadId,widget.token,widget.fullName)),
      );
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pisciculture Details',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_box_outlined, color: Colors.black),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPiscicultureDetails(widget.masterHeadId,widget.token,widget.fullName)),
                  ),
                ),
              ],
            ),
          ),
          body: details!=null?Stack(
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
              details.data!=null?SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () async {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Text(
                              'House No: '+details.data.houseNumber,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              details.data.mobileNumber,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),


                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(20),
                                    1: FlexColumnWidth(10),
                                    2: FlexColumnWidth(10),

                                  },
                                  border: TableBorder.all(
                                      color: Colors.black38,
                                      style: BorderStyle.solid,
                                      width: 1),
                                  children: [
                                    TableRow(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                        child: Text("Do You Have Fish Farming"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                        child: Text(details.data.haveFishFarming),
                                      ),

                                    ]),






                                  ]),
                            ),




                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ):Container(
                color: Colors.white,

                height: MediaQuery.of(context).size.height * 10,
                width: MediaQuery.of(context).size.width * 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'No Record Found',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ):Container(
            child: SplashScreen(
              seconds: 6,
              loadingText: Text("Loading"),
              photoSize: 100.0,
              loaderColor: Colors.blue,
            ),
          )
      ),
    );
  }
}
