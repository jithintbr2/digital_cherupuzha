import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:cpza/HttpService.dart';
import 'package:cpza/addOtherMembers.dart';
import 'package:cpza/familyMemberModel.dart';
import 'package:cpza/memberDetails.dart';
import 'package:cpza/viewRecords.dart';

class OtherMemberDetails extends StatefulWidget {
  int masterHeadId;
  String token;
  String fullName;

  OtherMemberDetails(this.masterHeadId,this.token,this.fullName);
  @override
  _OtherMemberDetailsState createState() => _OtherMemberDetailsState();
}

class _OtherMemberDetailsState extends State<OtherMemberDetails> {
  FamilyMemberModel familyMembers;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    familyMembers = await HttpService.familyMembers(widget.masterHeadId,widget.token);

    if(familyMembers!=null)
    {
      setState(() {

      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => memberDetails(widget.masterHeadId,widget.token,widget.fullName)),
      );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'View Members',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_box_outlined, color: Colors.black),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddOtherMembers(widget.masterHeadId,widget.token,widget.fullName)),
                ),
              ),
            ],
          ),
        ),
        body: familyMembers!=null?Stack(
          children: [
            familyMembers.data.length>0?Container(
              height: MediaQuery.of(context).size.height * 10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ):Container(
              height: MediaQuery.of(context).size.height * 10,
              width: MediaQuery.of(context).size.width * 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('No Record Found',style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
            ListView.builder(

                shrinkWrap: true,
                itemCount: familyMembers.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text(
                                familyMembers.data[index].name,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                familyMembers.data[index].relationship,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30,top: 10),
                                    child: Row(
                                      children: [
                                        Text('Age',style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.bold),),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                        Text(familyMembers.data[index].age.toString(),style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30,top: 10),
                                    child: Row(
                                      children: [
                                        Text(familyMembers.data[index].gender,style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Table(
                                    columnWidths: {
                                      0: FlexColumnWidth(20),
                                      1: FlexColumnWidth(20),

                                    },
                                    border: TableBorder.all(
                                        color: Colors.black38,
                                        style: BorderStyle.solid,
                                        width: 1),
                                    children: [
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("Marital Status"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].maritalStatus),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("Education"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].educationName),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("Occupation"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].occupation),
                                        ),
                                      ]),

                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("Current Residene"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].currentResidence),
                                        ),
                                      ]),
                                      if(familyMembers.data[index].place!="")TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("Place"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].place),
                                        ),
                                      ]),
                                      if(familyMembers.data[index].state!="")TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("State"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].state),
                                        ),
                                      ]),
                                      if(familyMembers.data[index].city!="")TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("City"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].city),
                                        ),
                                      ]),
                                      if(familyMembers.data[index].country!="")TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("Country"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].country),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("If own landss,How much in cent"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].landInCent),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("If Any Health Issues"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].healthIssue),
                                        ),
                                      ]),
                                      if(familyMembers.data[index].healthIssue=='Yes')TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("What is the health issue"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].whatHealthIssue),
                                        ),
                                      ]),
                                      if(familyMembers.data[index].healthIssue=='Yes')TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("Is the person under treatment"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].isUnderTreatment),
                                        ),
                                      ]),
                                      if(familyMembers.data[index].isUnderTreatment=='Yes')TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("Type of treatment"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].treatmentType),
                                        ),
                                      ]),

                                      if(familyMembers.data[index].isUnderTreatment=='Yes')TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text("if under medication, price of medicines per month"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Text(familyMembers.data[index].medicationPrice.toString()),
                                        ),
                                      ]),

                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })

          ],
        ):Container(
          child: SplashScreen(
            seconds: 6,
            loadingText: Text("Loading"),
            photoSize: 100.0,
            loaderColor: Colors.blue,
          ),
        )
      ),
    );
  }

}
