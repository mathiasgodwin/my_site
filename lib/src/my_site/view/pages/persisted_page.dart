import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_site/src/my_site/view/view.dart';
import 'package:my_site/src/my_site/view/widgets/app_bar.dart';
import 'package:my_site/src/util/ui/navigation/app_route.dart';
import 'package:my_site/src/util/ui/theme/styles.dart';

class PersistedPage extends StatefulWidget {
  const PersistedPage({
    required this.child,
    required this.location,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final String location;

  @override
  State<PersistedPage> createState() => _PersistedPageState();
}

class _PersistedPageState extends State<PersistedPage> {
  final tabs = [
    AppRouter.root,
    AppRouter.portfolio,
    AppRouter.contact,
  ];
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        smallLeading: [
          TextButton(
            onPressed: () {
              _goOtherTab(context, 0);
            },
            child: Text(
              'Home',
              style: _currentIndex == 0
                  ? theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    )
                  : theme.textTheme.bodyMedium,
            ),
          ),
          TextButton(
            onPressed: () {
              _goOtherTab(context, 1);
            },
            child: Text(
              'Portfolio',
              style: _currentIndex == 1
                  ? theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    )
                  : theme.textTheme.bodyMedium,
            ),
          ),
          TextButton(
            onPressed: () {
              _goOtherTab(context, 2);
            },
            child: Text(
              'Contact',
              style: _currentIndex == 2
                  ? theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    )
                  : theme.textTheme.bodyMedium,
            ),
          ),
        ],
        leading: SvgPicture.asset('assets/images/svg/logo.svg'),
        smallAction: UserFontFacingSocialsMedia(),
        action: [
          TextButton(
            onPressed: () {
              _goOtherTab(context, 0);
            },
            child: Text(
              'Home',
              style: _currentIndex == 0
                  ? theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    )
                  : theme.textTheme.bodyMedium,
            ),
          ),
          HSpace.s10,
          TextButton(
            onPressed: () {
              _goOtherTab(context, 1);
            },
            child: Text(
              'Portfolio',
              style: _currentIndex == 1
                  ? theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    )
                  : theme.textTheme.bodyMedium,
            ),
          ),
          TextButton(
            onPressed: () {
              _goOtherTab(context, 2);
            },
            child: Text(
              'Contact',
              style: _currentIndex == 2
                  ? theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    )
                  : theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
      body: widget.child,
    );
  }

  void _goOtherTab(BuildContext context, int index) {
    if (index == _currentIndex) return;
    final router = GoRouter.of(context);
    final location = tabs[index];

    setState(() {
      _currentIndex = index;
    });

    router.go(location);
  }
}
