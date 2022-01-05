
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/WaterAssetDataModel.dart';
import 'package:cpza/addWaterAssetModel.dart';
import 'package:cpza/common.dart';
import 'package:cpza/waterAssetDetails.dart';

class AddWaterAsset extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;
  AddWaterAsset(this.masterHeadId,this.token,this.fullName);

  @override
  _AddWaterAssetState createState() => _AddWaterAssetState();
}

class _AddWaterAssetState extends State<AddWaterAsset> {
  var source;
  var liftingMethod;
  var storage;
  var satisfied;
  var reason;
  var haveToilet;
  var waterAvailableInToilet;
  var typeOfToiletTank;

  WaterAssetDataModel availableList;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    availableList = await HttpService.waterAssetData();

    if(availableList!=null)
    {
      setState(() {

      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop()),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add Sanitation Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: availableList!=null?Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 5),
                      child: Text('Sanitation', style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 24, right: 10, top: 10),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButtonFormField <String>(
                              decoration: InputDecoration(
                                labelText: 'Do You Have Toilet',
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              isExpanded: true,
                              value: haveToilet,
                              items: availableList.data.toiletAvailability.map((data) {
                                return DropdownMenuItem(
                                  value: data.toiletAvailabilityId.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(data.toiletAvailability),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  haveToilet = newValue;
                                });
                                print(haveToilet);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    haveToilet=='1'?Padding(
                      padding:
                      const EdgeInsets.only(left: 24, right: 10, top: 10),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButtonFormField <String>(
                              decoration: InputDecoration(
                                labelText: 'Water Available In Toilet?',
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              isExpanded: true,
                              value: waterAvailableInToilet,
                              items: availableList.data.waterAvailabilityInToilet.map((data) {
                                return DropdownMenuItem(
                                  value: data.id.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(data.waterAvailabilityInToilet),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue1) {
                                setState(() {


                                  waterAvailableInToilet = newValue1;


                                });

                              },
                            ),
                          );
                        },
                      ),
                    ):Container(),

                    haveToilet=='1'?Padding(
                      padding:
                      const EdgeInsets.only(left: 24, right: 10, top: 10),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButtonFormField <String>(
                              decoration: InputDecoration(
                                labelText: 'Type Of Toilet Tank',
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              isExpanded: true,
                              value: typeOfToiletTank,
                              items: availableList.data.toiletTankType.map((data) {
                                return DropdownMenuItem(
                                  value: data.toiletTankTypeId.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(data.toiletTankType),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  typeOfToiletTank = newValue;
                                });
                                print(typeOfToiletTank);
                              },
                            ),
                          );
                        },
                      ),
                    ):Container(),
],
                ),
              ),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 7,
                  color: Colors.white,
                  child: FlatButton(
                    color: Colors.green,
                    onPressed: () async {

                    if (haveToilet==null) {
                        Common.toastMessaage('Choose Toilet Availablity', Colors.red);
                      }
                      else if (haveToilet=='1'&&waterAvailableInToilet==null) {
                        Common.toastMessaage('Choose Water Avalablity In Toilet', Colors.red);
                      }
                      else if (haveToilet=='1'&&typeOfToiletTank==null) {
                        Common.toastMessaage('Choose Tank Type Using In Toilet', Colors.red);
                      }
                      else{
                        AddWaterAssetModel object = await HttpService.addWaterAsset(haveToilet,waterAvailableInToilet,typeOfToiletTank,widget.token,widget.masterHeadId
                        );
                        if(object.status==true) {
                          Common.toastMessaage(
                              'Added Successfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WaterAssetDetails(widget.masterHeadId,widget.token,widget.fullName)),
                          );
                        }
                        else
                        {
                          Common.toastMessaage(
                              'Something Went Wrong', Colors.red);
                        }
                      }


                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
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
    );
  }
}
