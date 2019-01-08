import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_samples/blocs/home_v2_bloc.dart';

void main() {
  group('HomeBloc', () {
    test('Initial value', () {
      final homeBloc = HomeBloc();
      expect(homeBloc.counter, emits(0));
    });
    test('Second value', () {
      final homeBloc = HomeBloc();
      homeBloc.incrementCounter();
      expect(homeBloc.counter, emits(1));
    });
    test('Varios increments', () {
      final homeBloc = HomeBloc();
      homeBloc.incrementCounter();
      homeBloc.incrementCounter();
      expect(homeBloc.counter, emits(2));
    });
  });
}