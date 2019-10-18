import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/calendario.bloc.dart';
import 'package:klenzer_app/ui/screens/home/calendario/current_day.widget.dart';
import 'package:klenzer_app/ui/screens/home/calendario/month_days.widget.dart';
import 'package:klenzer_app/ui/screens/home/calendario/week_days.widget.dart';

class CalendarioWidget extends StatefulWidget {
  CalendarioWidget({Key key}) : super(key: key);

  @override
  _CalendarioWidgetState createState() => _CalendarioWidgetState();
}

class _CalendarioWidgetState extends State<CalendarioWidget> {
  @override
  void initState() {
    super.initState();
    CalendarioBloc.selectCurrentDate(currentDate: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WeekDaysWidget(),
        MonthDaysWidget(),
        CurrentDayWidget(),
      ],
    );
  }
}
