import 'package:flutter/material.dart';

class WidgetTestableEnvironment extends StatelessWidget {
  const WidgetTestableEnvironment({
    super.key,
    required this.child,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.routes = const <String, WidgetBuilder>{},
  });

  final Widget child;
  final List<NavigatorObserver> navigatorObservers;
  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: navigatorObservers,
      routes: routes,
      home: Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(size: Size(1000, 1000)),
            child: child,
          ),
        ),
      ),
    );
  }
}