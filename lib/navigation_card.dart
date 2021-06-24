import 'package:flutter/material.dart';

class NavigationCard extends StatelessWidget {
  final String title;
  final Widget w;
  final Color c;
  final IconData icon;
  const NavigationCard(
      {Key? key,
      this.title = "",
      this.c = Colors.green,
      this.icon = Icons.settings,
      required this.w})
      : super(key: key);

  Decoration getDecoration({Color c = Colors.grey}) {
    return BoxDecoration(
      color: c,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(7.0),
      boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 20.0,
        ),
      ],
    );
  }

  Widget getCard(String val, Color c, IconData icon) {
    return Container(
      //width: 300,
      height: 200,
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: getDecoration(c: c),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 70,
          ),
          Text(
            val,
            style: TextStyle(
              fontSize: 52,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(this.title);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => this.w,
          ),
        );
      },
      child: getCard(this.title, this.c, this.icon),
    );
  }
}
