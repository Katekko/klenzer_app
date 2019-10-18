import 'package:flutter/material.dart';
import 'package:klenzer_app/ui/screens/home/time_line/render_hours.widget.dart';

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE7E9F8),
      child: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 24,
            padding: EdgeInsets.only(top: 0),
            itemBuilder: (context, index) {
              dynamic hora = index + 1;
              if(hora < 10) hora = '0$hora';
              return RenderHours(
                label: hora.toString(),
                key: Key(hora.toString()),
              );
            },
          ),
        ],
      ),
    );
  }
}
