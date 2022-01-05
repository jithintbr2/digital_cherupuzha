import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addOtherDetails.dart';
import 'package:cpza/dashboard.dart';
import 'package:cpza/economicDetailListModel.dart';
import 'package:cpza/memberDetails.dart';

class OtherDetals extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;

  OtherDetals(this.masterHeadId, this.token, this.fullName);

  @override
  _OtherDetalsState createState() => _OtherDetalsState();
}

class _OtherDetalsState extends State<OtherDetals> {
  EconomicDetailsListModel details;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    details =
        await HttpService.economicDetails(widget.masterHeadId, widget.token);

    if (details != null) {
      setState(() {});
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
                  'Other Details',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_box_outlined, color: Colors.black),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddOtherDetails(
                            widget.masterHeadId, widget.token, widget.fullName)),
                  ),
                )
              ],
            ),
          ),
          body: details != null
              ? Stack(
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
                    details.data != null
                        ? SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                  onTap: () async {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      children: [
                                        Text(
                                          'House No : ' +
                                              details.data.houseNumber,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Text(
                                            details.data.mobileNumber,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15, top: 20),
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child:
                                                        Text("Social Category"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(details
                                                        .data.socialCategory),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child:
                                                        Text("Economic Category"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(details
                                                        .data.economicCategory),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(
                                                        "Type Of Ration Card"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(details
                                                        .data.rationCardType),
                                                  ),
                                                ]),
                                              ]),
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(
                                                        "ownership Status Of house"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Column(
                                                      children: [
                                                        Text(details.data
                                                            .houseOwnershipStatus),

                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                                if(details.data
                                                    .houseOwnershipStatus=='Rented')TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text("Rent Amount Per/Month"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text(
                                                        'Rs.'+details.data.rentAmount.toString()),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text("Whether received financial assistance for constructing house"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text(
                                                        details.data.financeForConstructionReceived),
                                                  ),
                                                ]),
                                                if(details.data
                                                    .financeForConstructionReceived=='Yes')TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text("Under Which Scheme"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text(
                                                        details.data.scheme),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text("No Of Floors"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text(
                                                        details.data.noOfFloors),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text("Roof"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(
                                                        details.data.roofType),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text("Does the house require any urgent repair works "),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text(
                                                        details.data.urgentRepairRequired),
                                                  ),
                                                ]),
                                                if(details.data.urgentRepairRequired=='Yes')TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text("What ?"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text(
                                                        details.data.whatRepair),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(
                                                        "Flooring Metel Used"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(details
                                                        .data.flooringMaterial),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(
                                                        "No of Bed Rooms In the House"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(
                                                        details.data.noOfRooms),
                                                  ),
                                                ]),

                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text(
                                                        "No. of bathrooms/toilets "),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text(
                                                        details.data.noOfToilets),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text(
                                                        "How many rooms have attached toilets"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 10),
                                                    child: Text(
                                                        details.data.toiletAttachedRooms.toString()),
                                                  ),
                                                ]),

                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text("Electricity"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(details
                                                        .data.electricityStatus),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text("Road Access"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(
                                                        details.data.roadAccess),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text("Fuel Used"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(
                                                        details.data.fuelUsed),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text("Catle Wealth"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(details
                                                        .data.cattleWealth),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text("Vehicle"),
                                                  ),
                                                   ListView.builder(
                                                    shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemBuilder: (context, index) {
                                                      return Padding(
                                                        padding: const EdgeInsets.only(top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                        child: Row(
                                                            children: [
                                                              Text(
                                                                  details.data.vehicleType[index].vehicles),
                                                              Text(
                                                                  '( '+details.data.vehicleType[index].vehicleCount+' )'),
                                                            ],
                                                          ),
                                                      );
                                                    },
                                                    itemCount:details.data.vehicleType.length,

                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(
                                                        "Media Device in HH"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                            left: 10),
                                                    child: Text(details
                                                        .data.mediaDevices),
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
                          )
                        : Container(
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
                )
              : Container(
                  child: SplashScreen(
                    seconds: 6,
                    loadingText: Text("Loading"),
                    photoSize: 100.0,
                    loaderColor: Colors.blue,
                  ),
                )),
    );
  }
}
