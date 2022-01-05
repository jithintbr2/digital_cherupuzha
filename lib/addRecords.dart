
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addRecordsModel.dart';
import 'package:cpza/common.dart';
import 'package:cpza/listVillageModel.dart';
import 'package:cpza/memberDetails.dart';
import 'package:cpza/otherMemberDetails.dart';
import 'package:cpza/viewRecords.dart';

class AddRecords extends StatefulWidget {
  String token;
  String fullName;
  AddRecords(this.token,this.fullName);


  @override
  _AddRecordsState createState() => _AddRecordsState();
}

class _AddRecordsState extends State<AddRecords> {

  TextEditingController mobileNumber = new TextEditingController();
  TextEditingController houseNumber = new TextEditingController();
  TextEditingController wardNo = new TextEditingController();

  var village;
  var locationMessage;
  var lattitude;
  var longitude;
  var altitude;
  ListVillageModel listVillage;
  void initState() {

    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    listVillage = await HttpService.listVillage();

    if(listVillage!=null)
    {
      setState(() {

      });
    }

  }
  void getCurrentLocation()
  async {
var position= await Geolocator().getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
var lastPosition= await Geolocator().getLastKnownPosition();
print(position.latitude);

setState(() {
  locationMessage= "$position.latitude,$position.longitude";
  lattitude=position.latitude;
  longitude=position.longitude;
  altitude=position.altitude;
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () =>Navigator.of(context).pop()
        ),
        title: Text(
          'Add Record',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: listVillage!=null?Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  textFeildFunction('Mobile Number', mobileNumber,TextInputType.number),
                  textFeildFunction('House Number', houseNumber,TextInputType.text),
                  Padding(
                    padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField <String>(
                            decoration: InputDecoration(
                              labelText: 'Select Village',
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

                            value: village,
                            items: listVillage.data.map((data) {
                              return DropdownMenuItem(
                                value: data.villageId.toString(),
                                child: Text(data.villageName),
                              );
                            }).toList(),

                            onChanged: (newValue) {
                              setState(() {
                                village = newValue;
                              });
                              print(village);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  textFeildFunction('Ward Number', wardNo,TextInputType.number),
                  locationMessage!=null?
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Lattude :'+lattitude.toString()),
                        Text('Longitude :'+longitude.toString()),
                        //Text('Altitude :'+altitude.toString())
                      ],
                    ),
                  )
                  :Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('No Location'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FlatButton(
                        onPressed: ()  {
                          getCurrentLocation();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                              Icon(Icons.location_on, color: Colors.black),
                            SizedBox(width: 10,),

                            Text(
                              'Current Location',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),



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
                   if (mobileNumber.text.isEmpty) {
                      Common.toastMessaage(
                          'Mobile Number cannot be empty', Colors.red);
                    }
                   else if (houseNumber.text.isEmpty) {
                     Common.toastMessaage(
                         'House Number cannot be empty', Colors.red);
                   }
                   else if (village==null) {
                     Common.toastMessaage(
                         'Choose Your Village', Colors.red);
                   }
                   else if (wardNo.text.isEmpty) {
                     Common.toastMessaage(
                         'Ward Number cannot be empty', Colors.red);
                   }
                   else if(lattitude==null)
                     {
                       Common.toastMessaage(
                           'Choose Current Location', Colors.red);
                     }
                   else if(longitude==null)
                   {
                     Common.toastMessaage(
                         'Choose Current Location', Colors.red);
                   }
                   else if(altitude==null)
                   {
                     Common.toastMessaage(
                         'Choose Current Location', Colors.red);
                   }
                    else
                      {
                        AddRecordModel object = await HttpService.addRecord(
                            mobileNumber.text,houseNumber.text,village,wardNo.text,widget.token,lattitude,longitude,altitude
                            );
                        if(object.status==true) {
                          Common.toastMessaage(
                              'Added Successfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => memberDetails(object.data,widget.token,widget.fullName)),
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
  textFeildFunction(hintname, controller,keyboardType) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Center(
          child: TextFormField(


            controller: controller,
            keyboardType:keyboardType,
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
            )
          ),
        ),
      ),
    );
  }
}
