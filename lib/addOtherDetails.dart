import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addEconicDataModel.dart';
import 'package:cpza/common.dart';
import 'package:cpza/economicListModel.dart';
import 'package:cpza/otherDetals.dart';

class AddOtherDetails extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;

  AddOtherDetails(this.masterHeadId, this.token, this.fullName);

  @override
  _AddOtherDetailsState createState() => _AddOtherDetailsState();
}



class _AddOtherDetailsState extends State<AddOtherDetails> {
  List<checkBoxClass> listItems;
  List<checkBoxClass> checkedItems = new List();
  //Map<checkBoxClass> checkedItems = new Map();
  Map checkedVehicles=Map();





  bool val = false;
  int totalPrice = 0;
  List<checkBoxClass> ids;
  List<checkBoxClass> vCount;






  List<checkBoxClassMedia> listItemsMedia;
  List<checkBoxClassMedia> checkedItemsMedia = new List();
  bool valMedia= false;
  int totalPriceMedia = 0;
  List<checkBoxClassMedia> mids;
  List<TextEditingController> _controllers = new List();

  var socialCategory;
  var economicCategory;
  var rationCardType;
  var ownershipStatus;
  var roof;
  var flooringMeterial;
  var noofRooms;
  var electricity;
  var roadAccess;
  var fuelUsed;
  var catleWealth;
  var vehicle;
  var mediaDevice;
  bool rent;
  var rentamount;
  var financialAssistance;
  var schemeName;
  var noOfFloors;
  var urgentRepair;
  var whaturgentRepair;
  var noOfbathrooms;
  var isVehicle;
  TextEditingController attached = new TextEditingController();
  TextEditingController rentAmount = new TextEditingController(text: '0');
  TextEditingController vehicleCount = new TextEditingController(text: '0');
  bool vehicleCountStatus=false;




  EconomicListModel economicList;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    listItems = new List();
    listItemsMedia = new List();
  }

  getData() async {
    economicList = await HttpService.economicList();

    if (economicList != null) {
      economicList.data.vehicleType.forEach((element) {
        listItems.add(checkBoxClass(
            element.vehicleTypeId,
            element.vehicleType));
      });

      economicList.data.mediaDevices.forEach((element) {
        listItemsMedia.add(checkBoxClassMedia(
            element.mediaDevicesId,
            element.mediaDevices));
      });
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
                'Add Other Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: economicList != null
            ? Stack(
                children: [

                  SingleChildScrollView(


                    child: Column(
                      children: [



                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Select Social Category',
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
                                  value: socialCategory,
                                  items: economicList.data.socialCategory
                                      .map((data) {
                                    return DropdownMenuItem(
                                      value: data.socialCategoryId.toString(),
                                      child: Text(data.socialCategory),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      socialCategory = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Select Economic Category',
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
                                  value: economicCategory,
                                  items: economicList.data.economicCategory
                                      .map((data) {
                                    return DropdownMenuItem(
                                      value: data.economicCategoryId.toString(),
                                      child: Text(data.economicCategory),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      economicCategory = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Type Of Ration Card',
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
                                  value: rationCardType,
                                  items: economicList.data.rationCardType
                                      .map((data) {
                                    return DropdownMenuItem(
                                      value: data.rationCardTypeId.toString(),
                                      child: Text(data.rationCardType),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      rationCardType = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Ownership status of house',
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
                                  value: ownershipStatus,
                                  items: economicList.data.houseOwnershipStatus
                                      .map((data) {
                                    return DropdownMenuItem(
                                      value: data.houseOwnershipStatusId
                                          .toString(),
                                      child: Text(data.houseOwnershipStatus),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      ownershipStatus = newValue;
                                    });
                                    print(ownershipStatus);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        ownershipStatus == '2'
                            ? textFeildFunction(
                                'Rent Amount', rentAmount, TextInputType.number)
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10, bottom: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText:
                                        'Whether received financial assistance for constructing house',
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
                                  value: financialAssistance,
                                  items: <String>['Yes', 'No'].map((data) {
                                    return DropdownMenuItem(
                                      value: data,
                                      child: Text(data),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      financialAssistance = newValue;
                                    });
                                    print(financialAssistance);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        financialAssistance == 'Yes'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 10, top: 10, bottom: 10),
                                child: FormField<String>(
                                  builder: (FormFieldState<String> state) {
                                    return DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          labelText: 'Under which scheme',
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        isExpanded: true,
                                        value: schemeName,
                                        items: economicList.data.financeScheme
                                            .map((data) {
                                          return DropdownMenuItem(
                                            value: data.schemeId.toString(),
                                            child: Text(data.scheme),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            schemeName = newValue;
                                          });
                                          print(schemeName);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'No. of Floors of House',
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
                                  value: noOfFloors,
                                  items: economicList.data.noFloors.map((data) {
                                    return DropdownMenuItem(
                                      value: data.noOfFloorsId.toString(),
                                      child: Text(data.noOfFloors),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      noOfFloors = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Select Roof',
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
                                  value: roof,
                                  items: economicList.data.roofType.map((data) {
                                    return DropdownMenuItem(
                                      value: data.roofTypeId.toString(),
                                      child: Text(data.roofType),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      roof = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10, bottom: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText:
                                        'Does the house require any urgent repair works ',
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
                                  value: urgentRepair,
                                  items: <String>['Yes', 'No'].map((data) {
                                    return DropdownMenuItem(
                                      value: data,
                                      child: Text(data),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      urgentRepair = newValue;
                                    });
                                    print(urgentRepair);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        if(urgentRepair=='Yes')Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'What is?',
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
                                  value: whaturgentRepair,
                                  items: economicList.data.houseRepair
                                      .map((data) {
                                    return DropdownMenuItem(
                                      value: data.repairWorkId.toString(),
                                      child: Text(data.repairWork),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      whaturgentRepair = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Flooring Meterial Used',
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
                                  value: flooringMeterial,
                                  items: economicList.data.flooringMaterial
                                      .map((data) {
                                    return DropdownMenuItem(
                                      value: data.flooringMaterialId.toString(),
                                      child: Text(data.flooringMaterial),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      flooringMeterial = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'No Of Bed Rooms in the House',
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
                                  value: noofRooms,
                                  items:
                                      economicList.data.noOfRooms.map((data) {
                                    return DropdownMenuItem(
                                      value: data.noOfRoomsId.toString(),
                                      child: Text(data.noOfRooms),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      noofRooms = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText:
                                        'No Of Bathrooms/ Toilet in the House',
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
                                  value: noOfbathrooms,
                                  items: economicList.data.noOfBathrooms
                                      .map((data) {
                                    return DropdownMenuItem(
                                      value: data.noOfBathroomsId.toString(),
                                      child: Text(data.noOfBathrooms),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      noOfbathrooms = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        textFeildFunction(
                            'How many rooms have attached toilets',
                            attached,
                            TextInputType.number),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Electrciy Status',
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
                                  value: electricity,
                                  items: economicList.data.electricityStatus
                                      .map((data) {
                                    return DropdownMenuItem(
                                      value:
                                          data.electricityStatusId.toString(),
                                      child: Text(data.electricityStatus),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      electricity = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Road Access',
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
                                  value: roadAccess,
                                  items:
                                      economicList.data.roadAccess.map((data) {
                                    return DropdownMenuItem(
                                      value: data.roadAccessId.toString(),
                                      child: Text(data.roadAccess),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      roadAccess = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Fuel Used',
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
                                  value: fuelUsed,
                                  items: economicList.data.fuelUsed.map((data) {
                                    return DropdownMenuItem(
                                      value: data.fuelUsedId.toString(),
                                      child: Text(data.fuelUsed),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      fuelUsed = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Catle Wealth',
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
                                  value: catleWealth,
                                  items: economicList.data.cattleWealth
                                      .map((data) {
                                    return DropdownMenuItem(
                                      value: data.cattleWealthId.toString(),
                                      child: Text(data.cattleWealth),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      catleWealth = newValue;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left:15,right: 10,top: 10,bottom: 10),
                          child: FormField<String>(

                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButtonFormField <String>(
                                  decoration: InputDecoration(
                                    labelText: 'Have You Vehicles?',
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

                                  value: isVehicle,
                                  items: <String>['Yes', 'No'].map((data) {
                                    return DropdownMenuItem(
                                      value: data,
                                      child: Text(data),
                                    );
                                  }).toList(),

                                  onChanged: (newValue) {
                                    setState(() {
                                      isVehicle = newValue;
                                    });
                                    print(isVehicle);
                                  },
                                ),
                              );
                            },
                          ),
                        ),

                        if(isVehicle=='Yes')Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('Choose Your Vehicles', style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),

                        if(isVehicle=='Yes')Vehicle(),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('Choose Media Device in House hold', style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),

                        mediaDevices(),


                        SizedBox(height: 80,)
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
                            if (socialCategory == null) {
                              Common.toastMessaage(
                                  'Choose Social Category', Colors.red);
                            } else if (economicCategory == null) {
                              Common.toastMessaage(
                                  'Choose Economic Category', Colors.red);
                            } else if (rationCardType == null) {
                              Common.toastMessaage(
                                  'Choose Type of Ration Card', Colors.red);
                            } else if (ownershipStatus == null) {
                              Common.toastMessaage(
                                  'Choose Ownership Status', Colors.red);
                            }

                            if (rentAmount.text.isEmpty) {
                              Common.toastMessaage(
                                  'Rent Amount Canot be empty', Colors.red);
                            } else if (noOfFloors == null) {
                              Common.toastMessaage(
                                  'Choose No of Floors', Colors.red);
                            } else if (roof == null) {
                              Common.toastMessaage(
                                  'Choose Roof Status', Colors.red);
                            } else if (urgentRepair == null) {
                              Common.toastMessaage(
                                  'Does the house require any urgent repair works ?',
                                  Colors.red);
                            } else if (flooringMeterial == null) {
                              Common.toastMessaage(
                                  'Choose Flooring Meterial', Colors.red);
                            } else if (noofRooms == null) {
                              Common.toastMessaage(
                                  'Choose No Of Bed Rooms', Colors.red);
                            } else if (noOfbathrooms == null) {
                              Common.toastMessaage(
                                  'Choose No Of Bathrooms', Colors.red);
                            } else if (attached.text.isEmpty) {
                              Common.toastMessaage(
                                  'Attached Toilets Cannot be Empty',
                                  Colors.red);
                            } else if (electricity == null) {
                              Common.toastMessaage(
                                  'Choose Electricity Status', Colors.red);
                            } else if (roadAccess == null) {
                              Common.toastMessaage(
                                  'Choose Road Access', Colors.red);
                            } else if (fuelUsed == null) {
                              Common.toastMessaage(
                                  'Choose Fuel Used', Colors.red);
                            } else if (catleWealth == null) {
                              Common.toastMessaage(
                                  'Choose Catle Wealth', Colors.red);
                            }
                            else if (isVehicle == null) {
                              Common.toastMessaage(
                                  'Choose vehicle Status', Colors.red);
                            }
                            else {
                              Map checkeVehicles1=Map(

                              );

                             // checkedItems.forEach((element) { checkeVehicles1[element.ids]=_controllers[checkedVehicles[element]].text;});
                              //checkedItems.forEach((element) {var jsonData ={ “id” : 1, “movie_name” : “3 Idiots”};});
                              Map<String, dynamic> body = {
                                "masterHeadId": widget.masterHeadId,
                                "socialCategory": socialCategory,
                                "economicCategory": economicCategory,
                                "rationCardType": rationCardType,
                                "houseOwnershipStatus": ownershipStatus,
                                "roofType": roof,
                                "flooringMaterial": flooringMeterial,
                                "noOfRooms": noofRooms,
                                "electricityStatus": electricity,
                                "roadAccess": roadAccess,
                                "fuelUsed": fuelUsed,
                                "cattleWealth": catleWealth,
                               "rentAmount": rentAmount.text,
                                "noOfToilets": noOfbathrooms,
                                "toiletAttachedRooms": attached.text,
                                "financeForConstructionReceived": financialAssistance,
                                "financeSheme": schemeName,
                                "urgentRepairRequired": urgentRepair,
                                "noOfFloors": noOfFloors,
                                "token":  widget.token,
                                "whatRepair":whaturgentRepair,
                                "vehicleStatus":  isVehicle,
                                "vehicleIds":checkedItems.map((e) =>{
                                  "id":e.ids,
                                  "vehicleCount": _controllers[checkedVehicles[e]].text,
                                 }).toList(),
                                "mediaIds":
                                checkedItemsMedia.map((e) => e.mids).toList(),


                              };
                              print (body);

                              AddEconomicDataModel object =
                                  await HttpService.addEcoomicData(body
                                      );
                              if (object.status == true) {
                                Common.toastMessaage(
                                    'Added Successfully', Colors.green);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtherDetals(
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

  textFeildFunction(hintname, controller, keyboardType) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: hintname,
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
    );
  }

  Vehicle() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {

        return chekBox(
            listItems[index],index);
      },
      itemCount:listItems.length,
    );
  }

  chekBox(checkBoxClass obj,index) {
    _controllers.add(new TextEditingController());
    checkedVehicles[obj]=index;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Expanded(
          child: CheckboxListTile(
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  obj.title,
                  style: TextStyle(fontSize: 15),
                ),
                  Container(

                  width: 80,
                  height: 40,
                  child: TextFormField(

                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(

                      labelText: 'Count',
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
                )

              ],
            ),value: checkedItems.contains(obj) ? true : false,
            onChanged: (bool value) {

              if (value) {
                _controllers[index].text='0';

                  setState(() {
                    totalPrice = 0;
                    checkedItems.add(obj);


                    //countVehicleList.add(_controllers[index].text.toString())
                  });


              }
              else
                {
                  setState(() {
                    _controllers[index].text='0';
                    totalPrice = 0;
                    checkedItems.remove(obj);
                });
                }
              print(checkedItems);
            },

            controlAffinity: ListTileControlAffinity.leading,
          ),
        )

      ],
    );
  }
  mediaDevices() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return chekBoxMedia(
            listItemsMedia[index]);
      },
      itemCount:listItemsMedia.length,
    );
  }

  chekBoxMedia(checkBoxClassMedia obj) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Expanded(
          child: CheckboxListTile(
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  obj.title,
                  style: TextStyle(fontSize: 15),
                ),

              ],
            ),value: checkedItemsMedia.contains(obj) ? true : false,
            onChanged: (bool value) {
              if (value) {

                setState(() {
                  totalPriceMedia = 0;
                  checkedItemsMedia.add(obj);


                });

}
              else
              {
                setState(() {
                  totalPriceMedia = 0;
                  checkedItemsMedia.remove(obj);


                });
              }

            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        )

      ],
    );
  }

}
class checkBoxClass {
  checkBoxClass(this.ids, this.title,{this.chheckval: false});

 int ids;
  bool chheckval;
  String title;



getChlk() {
    return chheckval;
  }

  gettitle() {
    return title;
  }
updateChk(val) {
    chheckval = val;
  }
}


class checkBoxClassMedia {
  checkBoxClassMedia(this.mids, this.title,{this.chheckval: false});

  int mids;
  bool chheckval;
  String title;


  getChlk() {
    return chheckval;
  }

  gettitle() {
    return title;
  }
  updateChk(val) {
    chheckval = val;
  }
}



