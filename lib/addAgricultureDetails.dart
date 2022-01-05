import 'package:flutter/material.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addAgricultureDataModel.dart';
import 'package:cpza/agricultureDetails.dart';
import 'package:cpza/common.dart';

class AddAgricultureDetails extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;
  AddAgricultureDetails(this.masterHeadId,this.token,this.fullName);

  @override
  _AddAgricultureDetailsState createState() => _AddAgricultureDetailsState();

}

class _AddAgricultureDetailsState extends State<AddAgricultureDetails> {
  TextEditingController rubber = new TextEditingController(text: '0');
  TextEditingController coconut = new TextEditingController(text: '0');
  TextEditingController arecnut = new TextEditingController(text: '0');
  TextEditingController cashew = new TextEditingController(text: '0');
  TextEditingController pepper = new TextEditingController(text: '0');
  TextEditingController cocoa = new TextEditingController(text: '0');
  TextEditingController rubberYielding = new TextEditingController(text: '0');
  TextEditingController coconutYielding = new TextEditingController(text: '0');
  TextEditingController arecnutYielding = new TextEditingController(text: '0');
  TextEditingController cashewYielding = new TextEditingController(text: '0');
  TextEditingController pepperYielding = new TextEditingController(text: '0');
  TextEditingController cocoaYielding = new TextEditingController(text: '0');
  var isRubber;
  var isCoconut;
  var isArecnut;
  var isCashew;
  var isPepper;
  var isCocoa;


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
            'Add Agriculture Details',
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
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                    child: Card(
                    elevation: 10,
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Rubber', style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 10),
                            child: FormField<String>(

                              builder: (FormFieldState<String> state) {
                                return DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField <String>(
                                    decoration: InputDecoration(
                                      labelText: 'Rubber?',
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

                                    value: isRubber,
                                    items: <String>['Yes', 'No'].map((data) {
                                      return DropdownMenuItem(
                                        value: data,
                                        child: Text(data),
                                      );
                                    }).toList(),

                                    onChanged: (newValue) {
                                      setState(() {
                                        isRubber = newValue;
                                      });
                                      print(isRubber);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          isRubber=='Yes'?textFeildFunction('Rubber Count', rubber,TextInputType.number):Container(), SizedBox(height: 10,),
                          isRubber=='Yes'?textFeildFunction('Rubber Yielding Count', rubberYielding,TextInputType.number):Container(), SizedBox(height: 10,),
                        ],
                      ),

                    ),
                  ),


                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                      child: Card(
                        elevation: 10,
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Coconut', style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 10),
                              child: FormField<String>(

                                builder: (FormFieldState<String> state) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField <String>(
                                      decoration: InputDecoration(
                                        labelText: 'Coconut ?',
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

                                      value: isCoconut,
                                      items: <String>['Yes', 'No'].map((data) {
                                        return DropdownMenuItem(
                                          value: data,
                                          child: Text(data),
                                        );
                                      }).toList(),

                                      onChanged: (newValue) {
                                        setState(() {
                                          isCoconut = newValue;
                                        });
                                        print(isCoconut);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            isCoconut=='Yes'?textFeildFunction('Coconut Count', coconut,TextInputType.number):Container(), SizedBox(height: 10,),
                            isCoconut=='Yes'?textFeildFunction('Coconut Yielding Count', coconutYielding,TextInputType.number):Container(), SizedBox(height: 10,),
                          ],
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                      child: Card(
                        elevation: 10,
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Arecnut', style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 10),
                              child: FormField<String>(

                                builder: (FormFieldState<String> state) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField <String>(
                                      decoration: InputDecoration(
                                        labelText: 'Arecnut ?',
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

                                      value: isArecnut,
                                      items: <String>['Yes', 'No'].map((data) {
                                        return DropdownMenuItem(
                                          value: data,
                                          child: Text(data),
                                        );
                                      }).toList(),

                                      onChanged: (newValue) {
                                        setState(() {
                                          isArecnut = newValue;
                                        });
                                        print(isArecnut);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            isArecnut=='Yes'?textFeildFunction('Arecnut Count', arecnut,TextInputType.number):Container(), SizedBox(height: 10,),
                            isArecnut=='Yes'?textFeildFunction('Arecnut Yielding Count', arecnutYielding,TextInputType.number):Container(), SizedBox(height: 10,),
                          ],
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                      child: Card(
                        elevation: 10,
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Cashew', style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 10),
                              child: FormField<String>(

                                builder: (FormFieldState<String> state) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField <String>(
                                      decoration: InputDecoration(
                                        labelText: 'Cashew ?',
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

                                      value: isCashew,
                                      items: <String>['Yes', 'No'].map((data) {
                                        return DropdownMenuItem(
                                          value: data,
                                          child: Text(data),
                                        );
                                      }).toList(),

                                      onChanged: (newValue) {
                                        setState(() {
                                          isCashew = newValue;
                                        });
                                        print(isCashew);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            isCashew=='Yes'?textFeildFunction('Cashew Count', cashew,TextInputType.number):Container(), SizedBox(height: 10,),
                            isCashew=='Yes'?textFeildFunction('Cashew Yielding Count', cashewYielding,TextInputType.number):Container(), SizedBox(height: 10,),
                          ],
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                      child: Card(
                        elevation: 10,
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Pepper', style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 10),
                              child: FormField<String>(

                                builder: (FormFieldState<String> state) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField <String>(
                                      decoration: InputDecoration(
                                        labelText: 'Pepper?',
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

                                      value: isPepper,
                                      items: <String>['Yes', 'No'].map((data) {
                                        return DropdownMenuItem(
                                          value: data,
                                          child: Text(data),
                                        );
                                      }).toList(),

                                      onChanged: (newValue) {
                                        setState(() {
                                          isPepper = newValue;
                                        });
                                        print(isPepper);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            isPepper=='Yes'?textFeildFunction('Pepper Count', pepper,TextInputType.number):Container(),
                            SizedBox(height: 10,),
                            isPepper=='Yes'?textFeildFunction('Pepper Yielding Count', pepperYielding,TextInputType.number):Container(),
                            SizedBox(height: 10,),
                          ],
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                      child: Card(
                        elevation: 10,
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Cocoa', style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 10),
                              child: FormField<String>(

                                builder: (FormFieldState<String> state) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField <String>(
                                      decoration: InputDecoration(
                                        labelText: 'Cocoa?',
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

                                      value: isCocoa,
                                      items: <String>['Yes', 'No'].map((data) {
                                        return DropdownMenuItem(
                                          value: data,
                                          child: Text(data),
                                        );
                                      }).toList(),

                                      onChanged: (newValue) {
                                        setState(() {
                                          isCocoa = newValue;
                                        });
                                        print(isCocoa);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            isCocoa=='Yes'?textFeildFunction('Cocoa Count', cocoa,TextInputType.number):Container(),
                            SizedBox(height: 10,),
                            isCocoa=='Yes'?textFeildFunction('Cocoa Yielding Count', cocoaYielding,TextInputType.number):Container(),
                            SizedBox(height: 10,),
                          ],
                        ),

                      ),
                    ),
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
                      if (isRubber==null) {
                        Common.toastMessaage(
                            'Choose Rubber ?', Colors.red);
                      }
                      else if (isRubber=='Yes'&&rubber.text.isEmpty) {
                        Common.toastMessaage(
                            'Rubber Count cannot be empty', Colors.red);
                      }
                      else if (isRubber=='Yes'&&rubberYielding.text.isEmpty) {
                        Common.toastMessaage(
                            'Rubber Yielding Count Cannot be empty', Colors.red);
                      }
                      else if (isCoconut==null) {
                        Common.toastMessaage(
                            'Choose Coconut ?', Colors.red);
                      }
                      else if (isCoconut=='Yes'&& coconut.text.isEmpty) {
                        Common.toastMessaage(
                            'Coconut Count cannot be empty', Colors.red);
                      }
                      else if (isCoconut=='Yes'&& coconutYielding.text.isEmpty) {
                        Common.toastMessaage(
                            'Coconut Yielding Count Cannot be empty', Colors.red);
                      }

                      else if (isArecnut==null) {
                        Common.toastMessaage(
                            'Choose Arecnut ?', Colors.red);
                      }
                      else if (isArecnut=='Yes'&& arecnut.text.isEmpty) {
                        Common.toastMessaage(
                            'Arecnut Count cannot be empty', Colors.red);
                      }
                      else if (isArecnut=='Yes'&& arecnutYielding.text.isEmpty) {
                        Common.toastMessaage(
                            'Arecnut Yielding Count Cannot be empty', Colors.red);
                      }

                      else if (isCashew==null) {
                        Common.toastMessaage(
                            'Choose Cashew ?', Colors.red);
                      }
                      else if (isCashew=='Yes'&& cashew.text.isEmpty) {
                        Common.toastMessaage(
                            'Cashew Count cannot be empty', Colors.red);
                      }
                      else if (isCashew=='Yes'&& cashewYielding.text.isEmpty) {
                        Common.toastMessaage(
                            'Cashew Yielding Count Cannot be empty', Colors.red);
                      }
                      else if (isPepper==null) {
                        Common.toastMessaage(
                            'Choose Pepper ?', Colors.red);
                      }
                      else if (isPepper=='Yes'&& pepper.text.isEmpty) {
                        Common.toastMessaage(
                            'Pepper Count cannot be empty', Colors.red);
                      }
                      else if (isPepper=='Yes'&& pepperYielding.text.isEmpty) {
                        Common.toastMessaage(
                            'Pepper Yielding Count Cannot be empty', Colors.red);
                      }
                      else if (isCocoa==null) {
                        Common.toastMessaage(
                            'Choose Cocoa ?', Colors.red);
                      }
                      else if (isCocoa=='Yes'&& cocoa.text.isEmpty) {
                        Common.toastMessaage(
                            'Cocoa Count cannot be empty', Colors.red);
                      }
                      else if (isCocoa=='Yes'&& coconutYielding.text.isEmpty) {
                        Common.toastMessaage(
                            'Cocoa Yielding Count Cannot be empty', Colors.red);
                      }


                     else
                      {
                        AddAgricultureDataModel object = await HttpService.addAgricultureData(
                            isRubber,rubber.text,rubberYielding.text,isCoconut,coconut.text,coconutYielding.text,
                            isArecnut,arecnut.text,arecnutYielding.text,isPepper,pepper.text,pepperYielding.text,
                            isCashew,cashew.text,cashewYielding.text,isCocoa,cocoa.text,cocoaYielding.text,widget.masterHeadId,widget.token
                        );
                        if(object.status==true) {
                          Common.toastMessaage(
                              'Added Successfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AgricultureDetails(widget.masterHeadId,widget.token,widget.fullName)),
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
