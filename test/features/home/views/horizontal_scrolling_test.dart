import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:molix/features/home/views/horizontal_scrolling_view.dart';

import '../../../widget_test_environment.dart';

void main() {
  testWidgets('HorizontalScrolling widget', (tester) async {
    await tester.pumpWidget(const WidgetTestableEnvironment(
      child: HorizontalScrollerWidget(
        title: 'Trending Movies',
        movies: [],
      ),
    ));
    final titleFinder = find.text('Trending Movies');
    final listView = find.byType(ListView);
    final listViewWidget = tester.widget<ListView>(find.byType(ListView));

    expect(titleFinder, findsOneWidget);
    expect(listView, findsOneWidget);
    expect(listViewWidget.scrollDirection, Axis.horizontal);
  });
}
