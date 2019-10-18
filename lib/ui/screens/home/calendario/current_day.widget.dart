import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klenzer_app/core/blocs/calendario.bloc.dart';

class CurrentDayWidget extends StatelessWidget {
  final principalColor, textColor;
  CurrentDayWidget({
    this.principalColor = 0xFF070618,
    this.textColor = 0xFF9AABB5,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!CalendarioBloc.isMonthDaysActived) {
          CalendarioBloc.toogleWeekDays();
        } else {
          CalendarioBloc.activateMonthDays(active: false);
          CalendarioBloc.activateWeekDays(active: false);
        }
      },
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity > 1) {
          CalendarioBloc.selectPreviousDay();
        } else if (details.primaryVelocity < -1) {
          CalendarioBloc.selectNextDay();
        }
      },
      child: StreamBuilder<DateTime>(
        stream: CalendarioBloc.currentDateStream,
        initialData: DateTime.now(),
        builder: (context, snapshot) {
          DateTime date = snapshot.data;
          String weekDay = DateFormat('EEEE').format(date).replaceAll(
                '-feira',
                '',
              );
          weekDay = weekDay[0].toUpperCase() + weekDay.substring(1);
          String month = DateFormat('LLL').format(date);

          bool isToday = date.day == DateTime.now().day;

          return Container(
            color: Color(principalColor),
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  color: Color(textColor),
                ),
                SizedBox(width: 10),
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOutCubic,
                  style: TextStyle(
                    color: Color(textColor),
                    fontSize: isToday ? 22 : 18,
                    fontWeight: isToday ? FontWeight.w600 : FontWeight.normal,
                  ),
                  child: Text(
                    '$weekDay, ${date.day} $month',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
