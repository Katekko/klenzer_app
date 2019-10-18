import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/calendario.bloc.dart';

class WeekDaysWidget extends StatelessWidget {
  final int principalColor, textColor;
  const WeekDaysWidget({
    this.principalColor = 0xFF070618,
    this.textColor = 0xFF9AABB5,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: CalendarioBloc.activateWeekDaysStream,
      initialData: false,
      builder: (context, snapshot) {
        if (snapshot.data) {
          return GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity > 1) {
                CalendarioBloc.activateMonthDays(active: true);
                CalendarioBloc.activateWeekDays(active: false);
              }
            },
            child: Container(
              width: double.infinity,
              height: 50,
              color: Color(principalColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildWeekDay(initials: 'S', index: 1),
                  _buildWeekDay(initials: 'T', index: 2),
                  _buildWeekDay(initials: 'Q', index: 3),
                  _buildWeekDay(initials: 'Q', index: 4),
                  _buildWeekDay(initials: 'S', index: 5),
                  _buildWeekDay(initials: 'S', index: 6),
                  _buildWeekDay(initials: 'D', index: 7),
                ],
              ),
            ),
          );
        }
        return Center();
      },
    );
  }

  Widget _buildWeekDay({@required String initials, @required int index}) {
    return StreamBuilder<DateTime>(
      stream: CalendarioBloc.currentDateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bool isToday = snapshot.data.weekday == index;
          return GestureDetector(
            onTap: () => CalendarioBloc.selectWeekDay(index: index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.all(10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isToday ? Color(0xFF686671) : Colors.transparent,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  initials,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }
        return Center();
      },
    );
  }
}
