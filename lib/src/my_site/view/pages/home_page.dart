// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_site/src/util/ui/theme/styles.dart';

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: SvgPicture.asset('assets/images/svg/logo.svg'),
        action: [
          const Text('Home'),
          HSpace.s10,
          const Text('Projects'),
        ],
      ),
      body: const Center(
        child: Text('This is HomePage'),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leading,
    this.action,
    this.title,
  }) : super(key: key);

  final Widget? leading;
  final List<Widget>? action;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 16,
        right: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: <Widget>[
                    if (leading == null) const SizedBox.shrink() else leading!
                  ],
                ),
              ),
              if (title == null) const SizedBox.shrink() else title!,
              if (action == null)
                const SizedBox.shrink()
              else
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: action!
                        .map(
                          (widget) => Flexible(
                            child: widget,
                          ),
                        )
                        .toList(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
