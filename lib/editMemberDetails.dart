
import 'package:cpza/editRecordModel.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addRecordsModel.dart';
import 'package:cpza/common.dart';
import 'package:cpza/listVillageModel.dart';
import 'package:cpza/memberDetails.dart';

class EditMemberDetails extends StatefulWidget {
  String token;
  String houseNumber;
  String mobileNumber;
  int wardnumber;
  int masterHeadId;
  int villageId;
  String fullName;

  EditMemberDetails(this.token,this.houseNumber,this.mobileNumber,this.wardnumber,this.masterHeadId,this.villageId,this.fullName);


  @override
  _EditMemberDetailsState createState() => _EditMemberDetailsState();
}

class _EditMemberDetailsState extends State<EditMemberDetails> {
  TextEditingController mobileNumber = new TextEditingController();
  TextEditingController houseNumber = new TextEditingController();
  TextEditingController wardNo = new TextEditingController();
String village;



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
        mobileNumber.text =widget.mobileNumber;
        houseNumber.text=widget.houseNumber;
        wardNo.text=widget.wardnumber.toString();
        village=widget.villageId.toString();

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
              onPressed: () =>Navigator.of(context).pop()
          ),
          title: Text(
            'Edit Record',
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
                      else
                      {
                        EditRecordModel object = await HttpService.editRecord(widget.masterHeadId,widget.token,
                            mobileNumber.text,houseNumber.text,village,wardNo.text
                        );
                        print(object.status);
                        if(object.status==true) {
                          Common.toastMessaage(
                              'Added Successfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => memberDetails(widget.masterHeadId,widget.token,widget.fullName)),
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
