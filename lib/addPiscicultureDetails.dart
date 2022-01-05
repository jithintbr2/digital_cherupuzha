
import 'package:flutter/material.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addPiscicultureModel.dart';
import 'package:cpza/common.dart';
import 'package:cpza/piscicultureDetails.dart';

class AddPiscicultureDetails extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;
  AddPiscicultureDetails(this.masterHeadId,this.token,this.fullName);

  @override
  _AddPiscicultureDetailsState createState() => _AddPiscicultureDetailsState();
}

class _AddPiscicultureDetailsState extends State<AddPiscicultureDetails> {
  var haveFishFarming;
  TextEditingController verityFish = new TextEditingController();
  TextEditingController FishCount = new TextEditingController();
  var facilityToFishFarming;
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
            'Add Pisciculture Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                      child: FormField<String>(

                        builder: (FormFieldState<String> state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButtonFormField <String>(
                              decoration: InputDecoration(
                                labelText: 'Have Fish Farming',
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

                              value: haveFishFarming,
                              items: <String>['Yes', 'No'].map((data) {
                                return DropdownMenuItem(
                                  value: data,
                                  child: Text(data),
                                );
                              }).toList(),

                              onChanged: (newValue) {
                                setState(() {
                                  haveFishFarming = newValue;
                                });
                                print(haveFishFarming);
                              },
                            ),
                          );
                        },
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
                      if (haveFishFarming==null) {
                        Common.toastMessaage(
                            'Have Fish Farming?', Colors.red);
                      }





                      else
                      {
                        AddPiscicultureModel object = await HttpService.addPiscicultureData(haveFishFarming,widget.masterHeadId,widget.token

                        );
                        if(object.status==true) {
                          Common.toastMessaage(
                              'Added Successfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PiscicultureDetails(widget.masterHeadId,widget.token,widget.fullName)),
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
        ),

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
