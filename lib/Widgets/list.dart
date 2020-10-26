import 'package:ec8/Models/period.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';


class Listy extends StatefulWidget {
  final Period period;
  const Listy({Key key, @required this.period}) : super(key: key);

  @override
  _ListyState createState() => _ListyState();
}

class _ListyState extends State<Listy> {

  Future<void> _launched;

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Link share',
        text: 'Zoom Link for ${widget.period.name}-${widget.period.type}',
        linkUrl: widget.period.link,
        chooserTitle: 'Share Zoom Link');
  }

  showAlert(BuildContext context) {
    Widget okButton =FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Details"),
      content: Text(
        "Class: ${widget.period.name}                                   "
            "                                   Teacher: ${widget.period.teacher}                "
            "                                         Start: ${widget.period.start}                                   "
            "                                   End: ${widget.period.end}                        "
            "                                   Link: ${widget.period.link}  ",

        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 6,),
      actions: <Widget>[
        okButton,
      ],
    );

    showDialog(context: context,
        builder: (BuildContext context){
          return alert;
        });
  }

  _launchURL(Period period) async {
    String url = period.link;
    if (await canLaunch(url)) {
      await launch(url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FaIcon(FontAwesomeIcons.dotCircle, color: Colors.red,),
        title: GestureDetector(
          onTap: () => setState(() {
            _launched = _launchURL(widget.period);
          }),
          child: Text('${widget.period.code}  ${widget.period.type}', style: GoogleFonts.mavenPro(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black87
          ),),
        ),
        subtitle: Text(
          "(${widget.period.start} - ${widget.period.end})"
        ),
        trailing: IconButton(
          icon: Icon(Icons.share, color: Colors.red,),
          onPressed: () => share(),
        ),
        //onTap: ,
        onLongPress: () => showAlert(context),
      ),
    );
  }
}
