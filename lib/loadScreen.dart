import 'dart:async';
import 'package:cpza/HttpService.dart';
import 'package:cpza/forceUpdate.dart';
import 'package:cpza/updateModel.dart';
import 'package:flutter/material.dart';
import 'package:cpza/common.dart';
import 'package:cpza/dashboard.dart';
import 'package:cpza/login.dart';
import 'package:new_version/new_version.dart';


class Splash2 extends StatefulWidget {
  @override
  _newSplashState createState() => _newSplashState();
}

class _newSplashState extends State<Splash2> {
  final splashDelay = 2;
  UpdateModel updatedata;


  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    updatedata = await HttpService.forceUpdate();
    final newVersion=NewVersion(
      androidId:"com.survey.cpza",
    );
    final status=await newVersion.getVersionStatus();
    print(status.localVersion);
    print(updatedata.data.minVersion);
    int versionCompare=status.localVersion.compareTo(updatedata.data.minVersion);
    if(versionCompare<0)
    {
      _checkVersion();
    }
    else
    {
      _loadWidget();
    }

  }
  void _checkVersion()
  async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ForceUpdate()),
    );
    /*final newVersion=NewVersion(
      androidId:"com.azyan",
    );
    final status=await newVersion.getVersionStatus();

    newVersion.showUpdateDialog(context: context,
      versionStatus: status,
      dialogTitle: "UPDATE!!!",
      dismissButtonText: "Skip",
      dialogText: "Please Update The app From "+ "${status.localVersion}"+" to "+"${status.storeVersion}",
      dismissAction: (){
        SystemNavigator.pop();
      },
      updateButtonText: "Update",

    );*/

  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    // return '';
    // return Timer(_duration, navigationPage);
    return Timer(_duration, routeTOHomePage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',width: 200,),
        ));
  }

  routeTOHomePage() async {
    // Navigator.pushReplacementNamed(context, RouteDashBoard);
    String tocken = await Common.getSharedPref("tocken");
    String fullName = await Common.getSharedPref("fullName");  

    if (tocken != null)
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  Dashboard(tocken,fullName)),
              (Route<dynamic> route) => false);

    else
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  Login()),
              (Route<dynamic> route) => false);

  }




}

