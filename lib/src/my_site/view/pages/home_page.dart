import 'package:flutter/material.dart';

/// TODO: Finish the docs
/// HomePage to...
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Static named route for page
  static const String route = 'Home';

  /// Static method to return the widget as a PageRoute
  static Route<void> go() =>
      MaterialPageRoute<void>(builder: (_) => const HomePage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is HomePage'),
      ),
    );
  }
}
