import 'package:flutter/material.dart';
import 'bloc1.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();
  Provider({super.key, required this.child}) : super(child: child);

  final Widget child;

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return true;
  }
}
