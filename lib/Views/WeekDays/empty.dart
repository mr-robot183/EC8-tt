import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyContent extends StatelessWidget {
  final String title;
  final String image;
  final String message;

  const EmptyContent({
    Key key,
    this.title = "Nothing Here",
    this.message = "Add A New Period",
    this.image = "Assets/Images/empty.png",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/2.3,
          decoration: BoxDecoration(
            //color: Colors.black,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fitHeight,
              )
          ),
        ),
        Text(title, style: GoogleFonts.mavenPro(fontSize: 35, color: Colors.red, fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message, style: GoogleFonts.mavenPro(fontSize: 15, color: Colors.red),),
        ),
      ],
    );
  }
}
