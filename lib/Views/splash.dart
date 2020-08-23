import 'package:ec8/Home/HomeMap.dart';
import 'package:ec8/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return Provider<dynamic>(
                  create: (context) => FirestoreDatabase(),
                  child: Consumer<dynamic>(
                      builder: (context,provider, child) =>HomeMap()
                  )
              );            }
        ))
    );
  }

  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Column(
          children: [
            SizedBox(height: queryData.size.height/2.3,),
            Center(
                child: Text("EC-8", style: GoogleFonts.audiowide(color: Colors.white, fontSize: 50),)
            ),
            Center(
                child: Text("TimeTable", style: GoogleFonts.audiowide(color: Colors.white, fontSize: 25),)
            ),
            SizedBox(height: queryData.size.height/4,),
            SpinKitCubeGrid(
              color: Colors.white,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
