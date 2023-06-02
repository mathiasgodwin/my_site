import 'package:flutter/material.dart';

/// TODO: Finish the docs
/// ContactPage to...
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  /// Static named route for page
  static const String route = 'Contact';

  /// Static method to return the widget as a PageRoute
  static Route go() => MaterialPageRoute<void>(builder: (_) => const ContactPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Text('This is ContactPage'),
      ),
    );
  }
}
