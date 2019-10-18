import 'package:flutter/material.dart';

class RenderHours extends StatelessWidget {
  @override
  final key;
  final String label;
  const RenderHours({this.label, this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: EdgeInsets.only(left: 15),
      height: MediaQuery.of(context).size.height * .25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '$label',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'h',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7),
            child: Text(
              '-',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
            ),
          ),
        ],
      ),
    );
  }
}
