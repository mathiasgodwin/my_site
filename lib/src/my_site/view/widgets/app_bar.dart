import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_site/src/my_site/logic/app_theme/app_theme_cubit.dart';
import 'package:my_site/src/my_site/view/widgets/user_social_media.dart';
import 'package:my_site/src/util/ui/theme/styles.dart';
import 'package:my_site/src/util/ui/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.smallAction, required this.smallLeading, Key? key,
    this.leading,
    this.action,
    this.title,
  }) : super(key: key);

  final Widget? leading;
  final List<Widget>? action;
  final Widget? title;
  final Widget smallAction;
  final List<Widget> smallLeading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isNormal = context.screenSize == ScreenSize.normal;
    return isNormal
        ? MobileAppBar(
            action: smallAction,
            leading: smallLeading,
          )
        : LargeScreenAppBar(
            theme: theme,
            leading: leading,
            title: title,
            action: action,
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class LargeScreenAppBar extends StatelessWidget {
  const LargeScreenAppBar({
    required this.theme,
    required this.leading,
    required this.title,
    required this.action,
    super.key,
  });

  final ThemeData theme;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(8),
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
}

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({required this.action, required this.leading, super.key});
  final List<Widget> leading;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer.withOpacity(.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: action,
            ),
            Align(
              alignment: const Alignment(-1.1, 0),
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(const Size(50, 50)),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.primaryContainer,
                  ),
                  child: CustomDrawer(
                    items: leading,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    required this.items, super.key,
  });
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        customButton: const Icon(Icons.list),
        hint: const Icon(
          Icons.list,
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<Widget>(
                value: item,
                child: item,
              ),
            )
            .toList(),
        onChanged: (v) {},
        dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: 200,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: theme.colorScheme.primaryContainer,
            ),
            offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            )),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
