import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addWaterAvailableDataModel.dart';
import 'package:cpza/common.dart';
import 'package:cpza/memberDetails.dart';
import 'package:cpza/waterAvailabiltyDetails.dart';
import 'package:cpza/waterUsageAvailableDataModel.dart';

class AddWaterAvailablity extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;

  AddWaterAvailablity(this.masterHeadId, this.token, this.fullName);

  @override
  _AddWaterAvailablityState createState() => _AddWaterAvailablityState();
}

class _AddWaterAvailablityState extends State<AddWaterAvailablity> {
  var distance;
  var slope;
  var purpose;
  var timeNeeded;

  var waterSourcePerminal;
  var sourceType;
  var lastPurchaseWater;
  var lastPurchaseWaterWeek;
  var pipeWaterConnection;
  var publicTapConnection;
  var timeSpendPublicTap;

  var liftingMethod;
  var satisfied;
  var reason;
  bool showbox = false;
  TextEditingController noOfSource = new TextEditingController();
  WaterUsageAvailableDataModel availableList;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    availableList = await HttpService.waterUsageData();

    if (availableList != null) {
      setState(() {});
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
                'Add Water Availablity',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: availableList != null
            ? Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Distance to the Drinking water source/ collection/ availability / distribution point (km)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 10, top: 5),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text('Select'),
                                    ),
                                    value: distance,
                                    items: availableList.data.distanceToSource
                                        .map((data) {
                                      return DropdownMenuItem(
                                        value:
                                            data.distanceToSourceId.toString(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(data.distanceToSource),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        distance = newValue;
                                      });
                                      print(distance);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Type of Source from which water is collected during summer',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 10, top: 5),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text("Select"),
                                    ),
                                    isExpanded: true,
                                    value: sourceType,
                                    items: availableList.data.waterSources
                                        .map((data) {
                                      return DropdownMenuItem(
                                        value: data.waterSourcesId.toString(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(data.waterSources),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        sourceType = newValue;
                                      });
                                      print(sourceType);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'No Of Water Source',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Center(
                              child: TextFormField(
                                controller: noOfSource,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'No of Source',
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
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Is The Water Source Perminal?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 10, top: 5),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text("Select"),
                                    ),
                                    value: waterSourcePerminal,
                                    items: availableList.data.waterPerennial
                                        .map((data) {
                                      return DropdownMenuItem(
                                        value: data.id.toString(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(data.isPerennial),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        waterSourcePerminal = newValue;
                                      });
                                      print(waterSourcePerminal);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Lifting Method',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text("Lifting Method"),
                                    ),
                                    value: liftingMethod,
                                    items: availableList.data.liftingMethod
                                        .map((data) {
                                      return DropdownMenuItem(
                                        value: data.liftingMethodId.toString(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(data.liftingMethod),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        liftingMethod = newValue;
                                      });
                                      print(liftingMethod);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Are you satisfied with the adequacy of water availability for your household',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text("select"),
                                    ),
                                    value: satisfied,
                                    items: <String>['Yes', 'No'].map((data) {
                                      return DropdownMenuItem(
                                        value: data,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(data),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        satisfied = newValue;
                                      });
                                      print(satisfied);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        satisfied == 'No'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  left: 24,
                                  top: 10,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Reson',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        satisfied == 'No'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 24, right: 10, top: 10),
                                child: FormField<String>(
                                  builder: (FormFieldState<String> state) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          hint: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text("Reason"),
                                          ),
                                          value: reason,
                                          items: availableList
                                              .data.waterDissatisfactionReason
                                              .map((data) {
                                            return DropdownMenuItem(
                                              value: data
                                                  .dissatisfactionReasonId
                                                  .toString(),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Text(
                                                    data.dissatisfactionReason),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            setState(() {
                                              reason = newValue;
                                            });
                                            print(reason);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(),
                      ],
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
                            if (distance == null) {
                              Common.toastMessaage(
                                  'Choose Distance to the Drinking water source/ collection/ availability / distribution point (km)',
                                  Colors.red);
                            } else if (sourceType == null) {
                              Common.toastMessaage(
                                  'Choose Type of Source from which water is collected during summer',
                                  Colors.red);
                            }
                            else if (noOfSource.text == null) {
                              Common.toastMessaage(
                                  'No Of Source Can not be empty', Colors.red);
                            } else if (waterSourcePerminal == null) {
                              Common.toastMessaage(
                                  'Choose Is the Water Source Perennial',
                                  Colors.red);
                            } else if (liftingMethod == null) {
                              Common.toastMessaage(
                                  'Choose Lifting Method', Colors.red);
                            } else if (satisfied == null) {
                              Common.toastMessaage(
                                  'Choose Satisfaction Status', Colors.red);
                            } else {
                              AddWaterAvailableDataModel object =
                                  await HttpService.addWaterAvailableData(
                                      distance,
                                      waterSourcePerminal,
                                      sourceType,
                                      liftingMethod,
                                      satisfied,
                                      reason,
                                      noOfSource.text,
                                      widget.masterHeadId,
                                      widget.token);
                              if (object.status == true) {
                                Common.toastMessaage(
                                    'Data Added Successfully', Colors.green);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WaterAvailability(
                                          widget.masterHeadId,
                                          widget.token,
                                          widget.fullName)),
                                );
                              } else {
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
              )
            : Container(
                child: SplashScreen(
                  seconds: 6,
                  loadingText: Text("Loading"),
                  photoSize: 100.0,
                  loaderColor: Colors.blue,
                ),
              ));
  }
}
