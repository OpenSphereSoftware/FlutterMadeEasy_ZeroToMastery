import 'package:advicer/2_application/pages/advice/widgets/advice_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest({required String adviceText}) {
    return MaterialApp(
      home: AdviceField(advice: adviceText),
    );
  }

  group(
    'AdviceField',
    () {
      group(
        'should be displayed correctly',
        () {
          testWidgets(
            'when a short text is given',
            (widgetTester) async {
              const text = 'a';

              await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
              await widgetTester.pumpAndSettle();

              final adviceFieldFinder = find.textContaining('a');

              expect(adviceFieldFinder, findsOneWidget);
            },
          );

          testWidgets(
            'when a long text is given',
            (widgetTester) async {
              const text =
                  'Hello flutter developers, i hope you enjoy the course, and have a great time. The sun is shining, i have no idea what else i should write here to get a very long text.';

              await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
              await widgetTester.pumpAndSettle();

              final adviceFieldFinder = find.byType(AdviceField);

              expect(adviceFieldFinder, findsOneWidget);
            },
          );

          testWidgets(
            'when no text is given',
            (widgetTester) async {
              const text = '';

              await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
              await widgetTester.pumpAndSettle();

              final adviceFieldFinder = find.text(AdviceField.emptyAdvice);
              final adviceText = widgetTester.widget<AdviceField>(find.byType(AdviceField)).advice;

              expect(adviceFieldFinder, findsOneWidget);
              expect(adviceText, '');
            },
          );
        },
      );
    },
  );
}
