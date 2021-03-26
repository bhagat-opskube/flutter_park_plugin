
import 'package:flutter/material.dart';
import 'package:flutter_park_plugin/navigation/navigator_help.dart';
import 'package:flutter_park_plugin/responsive/my_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkHomeScreen extends StatefulWidget {
  ParkHomeScreen({Key? key}):super(key:key);

  @override
  _ParkHomeScreenState createState() => _ParkHomeScreenState();
}

class _ParkHomeScreenState extends State<ParkHomeScreen> {


  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {

    return SafeArea(
      child: new Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                          padding:  EdgeInsets.all(size_8),
                          child: SvgPicture.asset("assets/images/park.svg",width: size_100,height: size_100,package: "flutter_park_plugin",)),
                      Text("Welcome to Park",style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: size_18),),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: size_12,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                      child: FutureBuilder(
                          future: getAppCurrentVersion(),builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData){
                          return Text("Version : ${snapshot.data}",style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: size_18,color: Colors.black),);
                        }
                        else
                          return Text("");})),
                ))
          ],
        ),
      ),
    );
  }
}

