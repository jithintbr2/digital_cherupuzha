import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addRecords.dart';
import 'package:cpza/common.dart';
import 'package:cpza/dashboard.dart';
import 'package:cpza/headModel.dart';
import 'package:cpza/memberDetails.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewRecords extends StatefulWidget {
  String tocken;
  String fullName;

  ViewRecords(this.tocken,this.fullName);

  @override
  _ViewRecordsState createState() => _ViewRecordsState();
}

class _ViewRecordsState extends State<ViewRecords> {
  TextEditingController search = new TextEditingController();
  String searchKey;
  bool isLoading = true;

  HeadModel headdata;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.tocken, searchKey);
  }

  getData(token, searchData) async {
    setState(() {
      isLoading = true;
    });
    headdata = await HttpService.viewRecords(token, searchData);
    if (headdata != null) {
      if (searchData != null) {
        Navigator.pop(context);
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () { Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  Dashboard(widget.tocken,widget.fullName)),
              (Route<dynamic> route) => false);
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
              IconButton(
                icon: Icon(Icons.add_box_outlined, color: Colors.black),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddRecords(widget.tocken,widget.fullName)),
                ),
              ),
            ],
          ),
        ),
        body: headdata!=null?Stack(
          children: [
            headdata.data.length>0?Container(
              height: MediaQuery.of(context).size.height * 10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ):Container(
              height: MediaQuery.of(context).size.height * 10,
              width: MediaQuery.of(context).size.width * 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('No Record Found',style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
            Align(
              child: top(),
              alignment: Alignment.topCenter,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 60),
                child: GridView.builder(
                  itemCount:headdata.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 8.0 / 10.0,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _listItems(index);
                  },
                ))
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

  _listItems(index) {
    return Padding(
        padding: EdgeInsets.only(left: 5, right: 5, top: 5),
        child: SingleChildScrollView(
          child: Card(
              elevation: 10,
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => memberDetails(headdata.data[index].masterHeadId,widget.tocken,widget.fullName)),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/house.png'),
                        radius: 25,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'House No: '+headdata.data[index].houseNumber,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          headdata.data[index].mobileNumber.toString(),
                          style: TextStyle(fontSize: 15),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'Ward No: '+headdata.data[index].wardNumber.toString(),
                          style: TextStyle(fontSize: 15),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 22),
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: () async {
                                String url = 'tel:'+headdata.data[index].mobileNumber.toString();
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call_sharp,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Call Member'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }

  top() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 10),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextFormField(
                  controller: search,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Phone Number',
                      contentPadding: const EdgeInsets.only(left: 20)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: FlatButton(
              onPressed: () async {
                Common.showProgressDialog(context, "Loading..");
                getData(widget.tocken, search.text);
              },
              child: Text(
                'Search',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
