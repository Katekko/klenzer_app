import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klenzer_app/core/blocs/calendario.bloc.dart';

class MonthDaysWidget extends StatelessWidget {
  const MonthDaysWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: CalendarioBloc.activateMonthDaysStream,
      initialData: false,
      builder: (context, snapshot) {
        if (snapshot.data) {
          return GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity > 1) {
                CalendarioBloc.selectPreviousMonth();
              } else if (details.primaryVelocity < -1) {
                CalendarioBloc.selectNextMonth();
              }
            },
            child: Container(
              color: Color(0xFF070618),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  _buildMonthName(),
                  SizedBox(height: 12),
                  _buildWeekDays(),
                  StreamBuilder<DateTime>(
                    stream: CalendarioBloc.currentDateStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return StreamBuilder<DateTime>(
                          stream: CalendarioBloc.currentMonthStream,
                          builder: (context, snapshotMonth) {
                            if (snapshotMonth.hasData) {
                              return _buildCurrentMonth(
                                currentDate: snapshot.data,
                                currentMonthSnapshot: snapshotMonth.data,
                              );
                            }
                            return Center();
                          },
                        );
                      }
                      return Center();
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return Center();
      },
    );
  }

  Widget _buildMonthName() {
    return StreamBuilder<DateTime>(
      stream: CalendarioBloc.currentMonthStream,
      builder: (_, snapshotMonth) {
        if (snapshotMonth.hasData) {
          String month = DateFormat('LLLL').format(
              DateTime(snapshotMonth.data.year, snapshotMonth.data.month));
          month = month[0].toUpperCase() + month.substring(1);
          return Text(
            '$month de ${snapshotMonth.data.year}',
            style: TextStyle(
              color: Color(0xFF9AABB5),
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          );
        }
        return Center();
      },
    );
  }

  Widget _buildWeekDays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildWeekDay(initials: 'S'),
        _buildWeekDay(initials: 'T'),
        _buildWeekDay(initials: 'Q'),
        _buildWeekDay(initials: 'Q'),
        _buildWeekDay(initials: 'S'),
        _buildWeekDay(initials: 'S'),
        _buildWeekDay(initials: 'D'),
      ],
    );
  }

  Widget _buildWeekDay({@required String initials}) {
    return SizedBox(
      width: 25,
      height: 20,
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentMonth({
    @required DateTime currentMonthSnapshot,
    @required DateTime currentDate,
  }) {
    int _currentMonth = currentMonthSnapshot.month;

    DateTime currentDayMonth = currentMonthSnapshot.subtract(
      Duration(days: currentMonthSnapshot.day - 1),
    );

    bool isOtherMonth = false;
    List<Widget> listDays = List<Widget>();
    List<Widget> listRows = List<Widget>();
    for (int i = 1; !isOtherMonth; i++) {
      bool isToday = currentMonthSnapshot.day == currentDayMonth.day;
      if (currentDayMonth.weekday == i) {
        DateTime current = currentDayMonth;
        listDays.add(
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isToday && currentDate == currentMonthSnapshot
                    ? Color(0xFF686671)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(7),
              ),
              child: InkWell(
                onTap: () =>
                    CalendarioBloc.selectCurrentDate(currentDate: current),
                child: Center(
                  child: Text(
                    currentDayMonth.day.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        currentDayMonth = currentDayMonth.add(Duration(days: 1));
        if (currentDayMonth.month != _currentMonth) {
          isOtherMonth = true;
          int daysLeft =
              currentDayMonth.weekday == 1 ? 0 : currentDayMonth.weekday - 8;
          for (int j = 0; j < daysLeft * (-1); j++) {
            listDays.add(SizedBox(width: 30));
          }
          listRows.add(
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: listDays,
              ),
            ),
          );
          break;
        }
      } else {
        listDays.add(SizedBox(width: 30));
      }
      if (i == 7) {
        listRows.add(
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: listDays,
            ),
          ),
        );
        listDays = [];
        i = 0;
      }
    }

    return Column(
      children: listRows,
    );
  }
}
