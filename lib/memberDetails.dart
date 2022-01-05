
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/agricultureDetails.dart';
import 'package:cpza/animalHusbandaryDetails.dart';
import 'package:cpza/dashboard.dart';
import 'package:cpza/debtInformationList.dart';
import 'package:cpza/editMemberDetails.dart';
import 'package:cpza/memberDetailsModel.dart';
import 'package:cpza/otherDetals.dart';
import 'package:cpza/otherMemberDetails.dart';
import 'package:cpza/piscicultureDetails.dart';
import 'package:cpza/viewRecords.dart';
import 'package:cpza/waterAssetDetails.dart';
import 'package:cpza/waterAvailabiltyDetails.dart';

class memberDetails extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;
  memberDetails(this.masterHeadId,this.token,this.fullName);
 @override
  _memberDetailsState createState() => _memberDetailsState();
}

class _memberDetailsState extends State<memberDetails> {
  MemberDetailsModel details;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    details = await HttpService.memberDetails(widget.masterHeadId,widget.token);

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
        MaterialPageRoute(builder: (context) => ViewRecords(widget.token,widget.fullName)),
      );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'View Records',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
      SingleChildScrollView(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10,top: 20),
              child: Card(
                elevation: 10,
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: InkWell(
                  onTap: () async {
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                       CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/house.png'),
                          radius: 30,
                        ),
                        SizedBox(height: 10,),

                        Text('House No: '+details.data.houseNumber,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text(details.data.mobileNumber,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
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
                                    child: Text('District',style: TextStyle(fontSize: 16,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child: Text(details.data.districtName,style: TextStyle(fontSize: 16),),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child: Text('Taluk',style: TextStyle(fontSize: 16,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child: Text(details.data.talukName,style: TextStyle(fontSize: 16),),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child: Text('Block',style: TextStyle(fontSize: 16,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child:  Text(details.data.blockName,style: TextStyle(fontSize: 16),),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child: Text('Panchayath',style: TextStyle(fontSize: 16,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child: Text(details.data.panchayathName,style: TextStyle(fontSize: 16),),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child: Text('Village',style: TextStyle(fontSize: 16,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child: Text(details.data.villageName,style: TextStyle(fontSize: 16),),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child: Text('Ward Number',style: TextStyle(fontSize: 16,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                    child: Text(details.data.wardNumber.toString(),style: TextStyle(fontSize: 16),),
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
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * .4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    OtherMemberDetails(details.data.masterHeadId,widget.token,widget.fullName)),
                                );

                      },
                      child: Text(
                        'Member Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  OtherDetals(details.data.masterHeadId,widget.token,widget.fullName)),
                        );

                      },
                      child: Text(
                        'Other Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * .4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  WaterAvailability(widget.masterHeadId,widget.token,widget.fullName)),
                        );

                      },
                      child: Text(
                        'Water Use and Availablity',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  WaterAssetDetails(widget.masterHeadId,widget.token,widget.fullName)),
                        );

                      },
                      child: Text(
                        'Sanitation',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * .4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  AgricultureDetails(widget.masterHeadId,widget.token,widget.fullName)),
                        );

                      },
                      child: Text(
                        'Agriculture',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  AnimalHusbandaryDetails(widget.masterHeadId,widget.token,widget.fullName)),
                        );

                      },
                      child: Text(
                        'Animal Husbandary',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * .4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  PiscicultureDetails(widget.masterHeadId,widget.token,widget.fullName)),
                        );

                      },
                      child: Text(
                        'Pisciculture',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  DebtInformationList(widget.masterHeadId,widget.token,widget.fullName)),
                        );

                      },
                      child: Text(
                        'Debit Information',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ) ,
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
