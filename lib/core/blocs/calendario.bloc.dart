import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class CalendarioBloc {
  static final _currentDateController = BehaviorSubject<DateTime>();
  static Observable<DateTime> get currentDateStream =>
      _currentDateController.stream;
  static DateTime get currentDate => _currentDateController.value;

  static final _currentMonthController = BehaviorSubject<DateTime>();
  static Observable<DateTime> get currentMonthStream =>
      _currentMonthController.stream;

  static final _activateWeekDaysController = PublishSubject<bool>();
  static Observable<bool> get activateWeekDaysStream =>
      _activateWeekDaysController.stream;

  static final _activateMonthDaysController = PublishSubject<bool>();
  static Observable<bool> get activateMonthDaysStream =>
      _activateMonthDaysController.stream;

  static DateTime _currentDate;
  static DateTime _currentMonth;
  static bool _weekDaysActived = false;
  static bool isMonthDaysActived = false;

  static void selectCurrentDate({@required DateTime currentDate}) {
    _currentDate = currentDate;
    _currentMonth = currentDate;
    _currentDateController.sink.add(currentDate);
    _currentMonthController.sink.add(currentDate);
  }

  static void selectCurrentMonth({@required DateTime currentMonth}) {
    _currentMonth = currentMonth;
    _currentMonthController.sink.add(currentMonth);
  }

  static void selectNextDay() {
    DateTime nextDay = _currentDate.add(Duration(days: 1));
    selectCurrentDate(currentDate: nextDay);
  }

  static void selectPreviousDay() {
    DateTime previousDay = _currentDate.subtract(Duration(days: 1));
    selectCurrentDate(currentDate: previousDay);
  }

  static void selectNextMonth() {
    DateTime nextMonth = _currentMonth.add(Duration(days: 31));
    selectCurrentMonth(currentMonth: nextMonth);
  }

  static void selectPreviousMonth() {
    DateTime previousMonth = _currentMonth.subtract(Duration(days: 31));
    selectCurrentMonth(currentMonth: previousMonth);
  }

  static void activateWeekDays({@required bool active}) {
    _weekDaysActived = active;
    _activateWeekDaysController.sink.add(active);
  }

  static void activateMonthDays({@required bool active}) {
    isMonthDaysActived = active;
    _activateMonthDaysController.sink.add(active);
  }

  static void toogleWeekDays() {
    _weekDaysActived = !_weekDaysActived;
    _activateWeekDaysController.sink.add(_weekDaysActived);
  }

  static void selectWeekDay({@required int index}) {
    int differenceWeekDay = index - _currentDate.weekday;
    DateTime currenteDate = _currentDate.add(Duration(days: differenceWeekDay));
    selectCurrentDate(currentDate: currenteDate);
  }

  void dispose() {
    _currentDateController.close();
    _activateWeekDaysController.close();
    _activateMonthDaysController.close();
    _currentMonthController.close();
  }
}
