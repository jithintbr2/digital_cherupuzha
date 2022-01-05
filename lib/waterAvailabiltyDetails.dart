
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addWaterAvailablity.dart';
import 'package:cpza/memberDetails.dart';
import 'package:cpza/waterAvailabilityDetailsModel.dart';

class WaterAvailability extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;
  WaterAvailability(this.masterHeadId,this.token,this.fullName);


  @override
  _WaterAvailabilityState createState() => _WaterAvailabilityState();
}

class _WaterAvailabilityState extends State<WaterAvailability> {
  WaterAvailablityDetailsModel details;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    details = await HttpService.waterAvailableDetails(widget.masterHeadId,widget.token);

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
                'Water Use And Availablity',
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
                  MaterialPageRoute(builder: (context) => AddWaterAvailablity(widget.masterHeadId,widget.token,widget.fullName)),
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
                                  1: FlexColumnWidth(20),

                                },
                                border: TableBorder.all(
                                    color: Colors.black38,
                                    style: BorderStyle.solid,
                                    width: 1),
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text("Distance to Water Source In Meter"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text(details.data.distanceToSource),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text("Type of Source from which water is collected during summer"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text(details.data.sourceType),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text("No of Water Source"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text(details.data.noOfSource.toString()),
                                    ),
                                  ]),


                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text("Is the Water Source Perennial"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text(details.data.isPerennial),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text("Water Lifting Method"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text(details.data.liftingMethod),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text("Are you satisfied with the adequacy of water availability for your household"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text(details.data.isSatisfiedWaterAvailability),
                                    ),
                                  ]),
                                  if(details.data.isSatisfiedWaterAvailability=='No')TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text("Reason"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                      child: Text(details.data.dissatisfactionReason),
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
