import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marquee_list/marquee_list.dart';

void main() {
  const breakingNews = [
    "AI-driven Automation Threatens to Disrupt Traditional Software Engineering Roles.",
    "Software Engineers Face Job Displacement as AI Takes Over Routine Tasks.",
    "AI Transforming Software Development Lifecycle, Redefining Industry Norms.",
    "AI's Rise in Software Engineering Sparks Debate Over Future Job Prospects.",
    "Software Engineers Brace for Impact as AI Continues to Reshape Industry.",
  ];

  Widget _boilerplate({required Widget child}) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(size: Size(800.0, 600.0)),
          child: Material(
            child: child,
          ),
        ),
      ),
    );
  }

  testWidgets('MarqueeList should render', (widgetTester) async {
    final widgets = breakingNews.map((item) => Text(item)).toList();

    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: _boilerplate(
            child: MarqueeList(
          scrollDirection: Axis.vertical,
          scrollDuration: const Duration(seconds: 3),
          children: widgets,
        )),
      ),
    ));

    expect(find.byType(MarqueeList), findsOneWidget);
  });

  testWidgets('MarqueeList should invoke onEnd callback when scroll ends',
      (widgetTester) async {
    final widgets = breakingNews.map((item) => Text(item)).toList();
    var onScrollEndCalled = false;
    await widgetTester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: _boilerplate(
          child: MarqueeList(
        scrollDirection: Axis.vertical,
        scrollDuration: const Duration(milliseconds: 300),
        onScrollEnd: () {
          onScrollEndCalled = true;
        },
        children: widgets,
      )),
    )));
    await widgetTester.pumpAndSettle(const Duration(seconds: 8));

    expect(onScrollEndCalled, true);
  });
}
