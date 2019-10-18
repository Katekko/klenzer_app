import 'package:rxdart/rxdart.dart';

class LoadingBloc {
  static final _loadingController = BehaviorSubject<bool>();
  static Observable<bool> get loadingStream => _loadingController.stream;

  static void updateLoading(bool loading) async {
    _loadingController.sink.add(loading);
  }
}
