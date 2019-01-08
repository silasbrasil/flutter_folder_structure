import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter increments smoke test', () {
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
