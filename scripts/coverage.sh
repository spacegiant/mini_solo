# See: https://pub.dev/packages/test#collecting-code-coverage
# dart pub global activate coverage
# Install: brew install lcov
# Set up coverage/report/index.html

## Run Dart tests and output them at directory `./coverage`:
flutter test --coverage
#dart run test --coverage=./coverage
#format_coverage --lcov --check-ignore

## Activate package `coverage` (if needed):
#dart pub global activate coverage

## Format collected coverage to LCOV (only for directory "lib")
#dart pub global run coverage:format_coverage --packages=.dart_tool/package_config.json --report-on=lib --lcov -o ./coverage/lcov.info -i ./coverage

## Generate LCOV report:
genhtml -o ./coverage/report ./coverage/lcov.info --ignore-errors empty

## Open the HTML coverage report:
open ./coverage/report/index.html