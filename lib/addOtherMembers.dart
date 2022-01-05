
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addMemberDetailsModel.dart';
import 'package:cpza/common.dart';
import 'package:cpza/commonListModel.dart';
import 'package:cpza/otherMemberDetails.dart';

class AddOtherMembers extends StatefulWidget {
int masterHeadId;
String token;
String fullName;
AddOtherMembers(this.masterHeadId,this.token,this.fullName);

  @override
  _AddOtherMembersState createState() => _AddOtherMembersState();
}

class _AddOtherMembersState extends State<AddOtherMembers> {
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController whatIsTheIssue = new TextEditingController();
  TextEditingController treatmentInstitution = new TextEditingController();
  TextEditingController medicinePrice = new TextEditingController();
  TextEditingController placeName = new TextEditingController();
  TextEditingController state = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController country = new TextEditingController();



  var relation;
  var maritalStatus;
  var gender;
  var healthIssues;
  var education;
  var occupation;
  var currentResidence;
  var landIncent;
  var underTreatment;
  var healthTreatment;
  CommonListModel commonList;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    commonList = await HttpService.commonList();

    if(commonList!=null)
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
            onPressed: () =>Navigator.of(context).pop()
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Add Members',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),


          ],
        ),
      ),
      body: commonList!=null?Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  textFeildFunction('Name', name,TextInputType.text),
                 Padding(
                    padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Select Relation',
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
                            value: relation,
                            items: commonList.data.relationship.map((data) {
                              return DropdownMenuItem(
                                value: data.relationshipId.toString(),
                                child: Text(data.relationship),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                relation = newValue;
                              });
                              print(relation);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Select Marital Status',
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
                            value: maritalStatus,
                            items: commonList.data.maritalStatus.map((data) {
                              return DropdownMenuItem(
                                value: data.maritalStatusId.toString(),
                                child: Text(data.maritalStatus),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                maritalStatus = newValue;
                              });
                              print(maritalStatus);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  textFeildFunction('Age', age,TextInputType.number),
                  Padding(
                    padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Select Gender',
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

                            value: gender,
                            items: commonList.data.gender.map((data) {
                              return DropdownMenuItem(
                                value: data.genderId.toString(),
                                child: Text(data.gender),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                gender = newValue;
                              });
                              print(gender);
                            },
                          ),
                        );
                      },
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Select Education',
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

                            value: education,
                            items: commonList.data.education.map((data) {
                              return DropdownMenuItem(
                                value: data.educationId.toString(),
                                child: Text(data.educationName),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                education = newValue;
                              });
                              print(education);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Select Occupation',
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

                            value: occupation,
                            items: commonList.data.occupation.map((data) {
                              return DropdownMenuItem(
                                value: data.occupationId.toString(),
                                child: Text(data.occupationName),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                occupation = newValue;
                              });
                              print(occupation);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(

                            decoration: InputDecoration(
                              labelText: 'Current Residence',
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

                            value: currentResidence,
                            items: commonList.data.currentResidence.map((data) {
                              return DropdownMenuItem(
                                value: data.residenceId.toString(),
                                child: Text(data.residence),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                currentResidence = newValue;
                              });
                              print(currentResidence);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  currentResidence=='2'?textFeildFunction('Place', placeName,TextInputType.text):Container(),
                  currentResidence=='2'?textFeildFunction('State', state,TextInputType.text):Container(),
                  currentResidence=='3'?textFeildFunction('City', city,TextInputType.text):Container(),
                  currentResidence=='3'?textFeildFunction('Country', country,TextInputType.text):Container(),
                  Padding(
                    padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'If Own Land How Much Cent',
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

                            value: landIncent,
                            items: commonList.data.landOwnership.map((data) {
                              return DropdownMenuItem(
                                value: data.landOwnershipId.toString(),
                                child: Text(data.landOwnership),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                landIncent = newValue;
                              });
                              print(landIncent);
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'If Any Health Issue?',
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

                            value: healthIssues,
                            items: commonList.data.healthIssueStatus.map((data) {
                              return DropdownMenuItem(
                                value: data.healthIssueStatusId.toString(),
                                child: Text(data.healthIssueStatus),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                healthIssues = newValue;
                              });
                              print(healthIssues);
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  healthIssues=='1'?textFeildFunction('What is The Issue', whatIsTheIssue,TextInputType.text):Container(),
                  healthIssues=='1'?Padding(
                    padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField <String>(
                            decoration: InputDecoration(
                              labelText: 'Is the person under treatment',
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

                            value: underTreatment,
                            items: <String>['Yes', 'No'].map((data) {
                              return DropdownMenuItem(
                                value: data,
                                child: Text(data),
                              );
                            }).toList(),

                            onChanged: (newValue) {
                              setState(() {
                                underTreatment = newValue;
                              });
                              print(underTreatment);
                            },
                          ),
                        );
                      },
                    ),
                  ):Container(),
                  underTreatment=='Yes'?Padding(
                    padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                    child: FormField<String>(

                      builder: (FormFieldState<String> state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Select Healthh Treatmet',
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
                            value: healthTreatment,
                            items: commonList.data.healthTreatment.map((data) {
                              return DropdownMenuItem(
                                value: data.healthTreatmentId.toString(),
                                child: Text(data.healthTreatment),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                healthTreatment = newValue;
                              });
                              print(healthTreatment);
                            },
                          ),
                        );
                      },
                    ),
                  ):Container(),

                  underTreatment=='Yes'?textFeildFunction('if under medication, price of medicines per month', medicinePrice,TextInputType.text):Container(),
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
                    if (name.text.isEmpty) {
                      Common.toastMessaage(
                          'Name cannot be empty', Colors.red);
                    } else if (relation==null) {
                      Common.toastMessaage(
                          'Choose Relation', Colors.red);
                    }
                    else if (maritalStatus==null) {
                      Common.toastMessaage(
                          'Choose Marital Status', Colors.red);
                    }
                    else if (age.text.isEmpty) {
                      Common.toastMessaage(
                          'Age cannot be empty', Colors.red);
                    }
                    else if (gender==null) {
                      Common.toastMessaage(
                          'Choose Gender', Colors.red);
                    }
                    else if (education==null) {
                      Common.toastMessaage(
                          'Choose Education', Colors.red);
                    }
                    else if (occupation==null) {
                      Common.toastMessaage(
                          'Choose Ocuupation', Colors.red);
                    }
                    else if (currentResidence==null) {
                      Common.toastMessaage(
                          'Choose Current Residence', Colors.red);
                    }
                    else if (currentResidence=='2'&&placeName.text.isEmpty) {
                      Common.toastMessaage(
                          'Enter Place Name Of the Residence', Colors.red);
                    }
                    else if (currentResidence=='2'&&state.text.isEmpty) {
                      Common.toastMessaage(
                          'Enter Stae Name Of the Residence', Colors.red);
                    }
                    else if (currentResidence=='3'&&city.text.isEmpty) {
                      Common.toastMessaage(
                          'Enter City Name Of the Residence', Colors.red);
                    }
                    else if (currentResidence=='3'&&country.text.isEmpty) {
                      Common.toastMessaage(
                          'Enter Country Name Of the Residence', Colors.red);
                    }
                    else if (landIncent==null) {
                      Common.toastMessaage(
                          'Choose your Land Ownership', Colors.red);
                    }
                    else if (healthIssues==null) {
                      Common.toastMessaage(
                          'Choose your Health data', Colors.red);
                    }
                    else
                      {
                        AddMemberDetailsModel object = await HttpService.addOtherMemberDetails(
                            widget.masterHeadId,widget.token,name.text,relation,age.text,gender,education,occupation,currentResidence,
                            landIncent,healthIssues,whatIsTheIssue.text,underTreatment,healthTreatment,medicinePrice.text,
                          placeName.text,state.text,city.text,country.text,maritalStatus
                        );
                        if(object.status==true) {
                          Common.toastMessaage(
                              'Added Successfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtherMemberDetails(widget.masterHeadId,widget.token,widget.fullName)),
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
