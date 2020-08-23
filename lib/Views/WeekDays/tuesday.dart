import 'package:ec8/Models/period.dart';
import 'package:ec8/Views/WeekDays/empty.dart';
import 'package:ec8/Widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class Tuesday extends StatefulWidget {
  @override
  _TuesdayState createState() => _TuesdayState();
}

class _TuesdayState extends State<Tuesday> {
  Widget _buildContents(BuildContext context) {
    final database  = Provider.of<dynamic>(context);
    return StreamBuilder<List<Period>>(
        stream: database.periodTuesStream(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final periods = snapshot.data;
            if(periods.isNotEmpty) {
              final children = periods.map((period) =>
                  Listy(period: period, )).toList();
              return ListView(children: children,);
            } return EmptyContent();
          }
          if(snapshot.hasError) {
            return Center(child: Text("error occured"),);
          }
          return SpinKitCubeGrid(
            color: Colors.indigoAccent,
            size: 50.0,
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(child: _buildContents(context),),
            ],
          ),
        ),
      ),
    );
  }
}

