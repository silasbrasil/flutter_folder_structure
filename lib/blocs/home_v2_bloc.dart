import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _counter = BehaviorSubject<int>(seedValue: 0);

  Stream get counter => _counter.stream;

  void incrementCounter() {
    _counter.add(_counter.value + 1);
  }

  void dispose() {
    _counter.close();
  }
}