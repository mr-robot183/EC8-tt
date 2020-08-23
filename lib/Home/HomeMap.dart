import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ec8/Models/period.dart';
import 'package:ec8/Services/database.dart';
import 'package:ec8/Views/WeekDays/friday.dart';
import 'package:ec8/Views/WeekDays/monday.dart';
import 'package:ec8/Views/WeekDays/saturday.dart';
import 'package:ec8/Views/WeekDays/thursday.dart';
import 'package:ec8/Views/WeekDays/tuesday.dart';
import 'package:ec8/Views/WeekDays/wednesday.dart';


class HomeMap extends StatefulWidget {
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return DefaultTabController(length: 6, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 5,
        centerTitle: true,
        title: Text("EC-8", style: GoogleFonts.audiowide(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
        bottom: TabBar(
          indicatorColor: Colors.white,
          isScrollable: true,
          tabs: <Widget>[
            Container(
              height: queryData.size.height/15,
              width: queryData.size.width/4,
              child: Center(
                child: Text("Monday", style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),
            ),
            Container(
              height: queryData.size.height/15,
              width: queryData.size.width/4,
              child: Center(
                child: Text("Tuesday", style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),

            ),
            Container(
              height: queryData.size.height/15,
              width: queryData.size.width/4,
              child: Center(
                child: Text("Wednesday", style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),

            ),
            Container(
              height: queryData.size.height/15,
              width: queryData.size.width/4,
              child: Center(
                child: Text("Thursday", style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),

            ),
            Container(
              height: queryData.size.height/15,
              width: queryData.size.width/4,
              child: Center(
                child: Text("Friday", style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),

            ),
            Container(
              height: queryData.size.height/15,
              width: queryData.size.width/4,
              child: Center(
                child: Text("Saturday", style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),

            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/Images/one.jpeg'),
                      fit: BoxFit.cover
                  )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("EC-8", style: GoogleFonts.audiowide(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo
                    ),),
                  ],
                ),
              ),
            ),
            Card(child: ListTile(
              leading: Icon(Icons.feedback, color: Colors.indigo,),
              title: Text("Feedback", style: GoogleFonts.mavenPro(
                  fontSize: 23,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87
              ),),
            ),),
            Card(child: ListTile(
              leading: Icon(Icons.help, color: Colors.indigo,),
              title: Text("Help Centre", style: GoogleFonts.mavenPro(
                  fontSize: 23,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87
              ),),
            ),),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot, {Period period}) {
              return Provider<dynamic>(
                create: (context) {
                  return FirestoreDatabase();
                },
                child: Monday(),
              );
            },
          ),
          FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot, {Period period}) {
              FirebaseUser user = snapshot.data;
              return Provider<dynamic>(
                create: (context) {
                  return FirestoreDatabase();
                },
                child: Tuesday(),
              );
            },
          ),
          FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot, {Period period}) {
              FirebaseUser user = snapshot.data;
              return Provider<dynamic>(
                create: (context) {
                  return FirestoreDatabase();
                },
                child: Wednesday(),
              );
            },
          ),
          FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot, {Period period}) {
              FirebaseUser user = snapshot.data;
              return Provider<dynamic>(
                create: (context) {
                  return FirestoreDatabase();
                },
                child: Thursday(),
              );
            },
          ),
          FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot, {Period period}) {
              FirebaseUser user = snapshot.data;
              return Provider<dynamic>(
                create: (context) {
                  return FirestoreDatabase();
                },
                child: Friday(),
              );
            },
          ),
          FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot, {Period period}) {
              FirebaseUser user = snapshot.data;
              return Provider<dynamic>(
                create: (context) {
                  return FirestoreDatabase();
                },
                child: Saturday(),
              );
            },
          ),
        ],
      ),
    ));
  }
}
