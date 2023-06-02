import 'package:flutter/material.dart';

/// TODO: Finish the docs
/// PortfolioPage to...
class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  /// Static named route for page
  static const String route = 'Portfolio';

  /// Static method to return the widget as a PageRoute
  static Route go() => MaterialPageRoute<void>(builder: (_) => PortfolioPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Text('This is PortfolioPage'),
      ),
    );
  }
}
