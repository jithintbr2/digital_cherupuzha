
import 'package:flutter/material.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addDebitInformationModel.dart';
import 'package:cpza/common.dart';
import 'package:cpza/debitInfoDataModel.dart';
import 'package:cpza/debtInformationList.dart';

class AddDebtInormationDetails extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;
  AddDebtInormationDetails(this.masterHeadId,this.token,this.fullName);

  @override
  _AddDebtInormationDetailsState createState() => _AddDebtInormationDetailsState();
}

class _AddDebtInormationDetailsState extends State<AddDebtInormationDetails> {
  var isDebited;
  var bankName;
  var isPrivateFinance;
  var FinanceName;
  TextEditingController debiitAmount = new TextEditingController();
  var isSocialOrganization;
  TextEditingController nameOfOrganization = new TextEditingController();
  DebitInfoDataModel debitInfo;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }

  getData() async {
    debitInfo = await HttpService.debitInfo();

    if (debitInfo != null) {


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
            onPressed: () =>Navigator.of(context).pop()
        ),
        title: Text(
          'Add Debit & Organization',
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
                              labelText: 'Has the family taken any bank loans',
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

                            value: isDebited,
                            items: <String>['Yes', 'No'].map((data) {
                              return DropdownMenuItem(
                                value: data,
                                child: Text(data),
                              );
                            }).toList(),

                            onChanged: (newValue) {
                              setState(() {
                                isDebited = newValue;
                              });
                              print(isDebited);
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  if(isDebited=='Yes')
                    Padding(
                      padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                      child: FormField<String>(

                        builder: (FormFieldState<String> state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButtonFormField <String>(
                              decoration: InputDecoration(
                                labelText: 'Bank Name',
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

                              value: bankName,
                              items: debitInfo.data.bank
                                  .map((data) {
                                return DropdownMenuItem(
                                  value: data.bankId.toString(),
                                  child: Text(data.bankName),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  bankName = newValue;
                                });
                                print(bankName);
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
                          child: DropdownButtonFormField <String>(
                            decoration: InputDecoration(
                              labelText: 'Has the family taken any loans from private financing firms ',
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

                            value: isPrivateFinance,
                            items: <String>['Yes', 'No'].map((data) {
                              return DropdownMenuItem(
                                value: data,
                                child: Text(data),
                              );
                            }).toList(),

                            onChanged: (newValue) {
                              setState(() {
                                isPrivateFinance = newValue;
                              });
                              print(isPrivateFinance);
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  if(isPrivateFinance=='Yes')
                    Padding(
                      padding: const EdgeInsets.only(left:15,right: 10,top: 10),
                      child: FormField<String>(

                        builder: (FormFieldState<String> state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButtonFormField <String>(
                              decoration: InputDecoration(
                                labelText: 'Finance Name',
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

                              value: FinanceName,
                              items: debitInfo.data.financeFirm
                                  .map((data) {
                                return DropdownMenuItem(
                                  value: data.financeId.toString(),
                                  child: Text(data.finance),
                                );
                              }).toList(),

                              onChanged: (newValue) {
                                setState(() {
                                  FinanceName = newValue;
                                });
                                print(FinanceName);
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
                          child: DropdownButtonFormField <String>(
                            decoration: InputDecoration(
                              labelText: 'Membership in Social Organizations',
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

                            value: isSocialOrganization,
                            items: <String>['Yes', 'No'].map((data) {
                              return DropdownMenuItem(
                                value: data,
                                child: Text(data),
                              );
                            }).toList(),

                            onChanged: (newValue) {
                              setState(() {
                                isSocialOrganization = newValue;
                              });
                              print(isSocialOrganization);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  isSocialOrganization=='Yes'?textFeildFunction('Name of the organization', nameOfOrganization,TextInputType.text):Container()






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
                    if (isDebited==null) {
                      Common.toastMessaage(
                          'Has the family taken any bank loans', Colors.red);
                    }

                    if (isPrivateFinance==null) {
                      Common.toastMessaage(
                          'Has the family taken any loans from private financing firms ', Colors.red);
                    }



                    else if(isSocialOrganization==null)
                    {
                      Common.toastMessaage(
                          'Membership in Social Organizations', Colors.red);
                    }

                    else if(isSocialOrganization=='Yes' && nameOfOrganization.text.isEmpty)
                    {
                      Common.toastMessaage(
                          'Name Of  Social Organizations', Colors.red);
                    }

                    else
                    {
                      AddDebitInformationModel object = await HttpService.addDebitInformation(isDebited,bankName,isPrivateFinance,FinanceName,
                          isSocialOrganization,nameOfOrganization.text,widget.masterHeadId,widget.token

                      );
                      if(object.status==true) {
                        Common.toastMessaage(
                            'Added Successfully', Colors.green);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DebtInformationList(widget.masterHeadId,widget.token,widget.fullName)),
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
