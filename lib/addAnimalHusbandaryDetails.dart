
import 'package:flutter/material.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addAnimalDataModel.dart';
import 'package:cpza/animalHusbandaryDetails.dart';
import 'package:cpza/common.dart';

class AddAnimalHusbandaryDetails extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;
  AddAnimalHusbandaryDetails(this.masterHeadId,this.token,this.fullName);


  @override
  _AddAnimalHusbandaryDetailsState createState() => _AddAnimalHusbandaryDetailsState();
}

class _AddAnimalHusbandaryDetailsState extends State<AddAnimalHusbandaryDetails> {
  TextEditingController buffalo = new TextEditingController(text: '0');
  TextEditingController cows = new TextEditingController(text: '0');
  TextEditingController goats = new TextEditingController(text: '0');
  TextEditingController pigs = new TextEditingController(text: '0');
  TextEditingController rabits = new TextEditingController(text: '0');
  TextEditingController poultryLayers = new TextEditingController(text: '0');
  TextEditingController poultryBroilers = new TextEditingController(text: '0');
  var liveStock;
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
          'Add Animal Details',
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
                              labelText: 'Live Stock',
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

                            value: liveStock,
                            items: <String>['Yes', 'No'].map((data) {
                              return DropdownMenuItem(
                                value: data,
                                child: Text(data),
                              );
                            }).toList(),

                            onChanged: (newValue) {
                              setState(() {
                                liveStock = newValue;
                              });
                              print(liveStock);
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  textFeildFunction('Buffalo Count', buffalo,TextInputType.number),
                  textFeildFunction('Cows Count', cows,TextInputType.text),
                  textFeildFunction('Goats Count', goats,TextInputType.number),
                  textFeildFunction('Pigs Count', pigs,TextInputType.number),
                  textFeildFunction('Rabbits Count', rabits,TextInputType.number),
                  textFeildFunction('Poultry Layers Count', poultryLayers,TextInputType.number),
                  textFeildFunction('Poultry Broilers Count', poultryBroilers,TextInputType.number),
                  SizedBox(height: 80,),







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
                    if (liveStock==null) {
                      Common.toastMessaage(
                          'Choose Live Stock Avalable', Colors.red);
                    }
                    else if (buffalo.text.isEmpty) {
                      Common.toastMessaage(
                          'Buffalo Count cannot be empty', Colors.red);
                    }

                    else if (cows.text.isEmpty) {
                      Common.toastMessaage(
                          'Cows Count cannot be empty', Colors.red);
                    }

                    else if (goats.text.isEmpty) {
                      Common.toastMessaage(
                          'Goats Count cannot be empty', Colors.red);
                    }


                    else if (pigs.text.isEmpty) {
                      Common.toastMessaage(
                          'Pigs Count cannot be empty', Colors.red);
                    }


                    else if (rabits.text.isEmpty) {
                      Common.toastMessaage(
                          'Rabbits Count cannot be empty', Colors.red);
                    }

                    else if (poultryLayers.text.isEmpty) {
                      Common.toastMessaage(
                          'Poultry layers Count cannot be empty', Colors.red);
                    }
                    else if (poultryBroilers.text.isEmpty) {
                      Common.toastMessaage(
                          'Poultry Broilers Count cannot be empty', Colors.red);
                    }

                    else
                    {
                      AddAnimalDataModel object = await HttpService.addAnimalData(
                         liveStock,buffalo.text,cows.text,goats.text,pigs.text,rabits.text,poultryLayers.text,
                          poultryBroilers.text,widget.masterHeadId,widget.token
                      );
                      if(object.status==true) {
                        Common.toastMessaage(
                            'Added Successfully', Colors.green);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimalHusbandaryDetails(widget.masterHeadId,widget.token,widget.fullName)),
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
                    width: 1.0,
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
