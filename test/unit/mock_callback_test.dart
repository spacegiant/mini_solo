import 'package:mini_solo/utilities/mock_callback.dart';
import 'package:test/test.dart';

void main() {
  test('Test reset method', () {
    MockCallback mock = MockCallback();
    expect(mock.called(0), isTrue);
    mock.call();
    expect(mock.called(1), isTrue);
    mock.reset();
    expect(mock.called(0), isTrue);
  });
}
