// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_site/src/my_site/view/widgets/user_social_media.dart';
import 'package:my_site/src/util/ui/theme/styles.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:responsive_toolkit/responsive_toolkit.dart';
import 'package:user_data/user_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wolt_responsive_layout_grid/wolt_responsive_layout_grid.dart';

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
    final isNormal = context.screenSize == ScreenSize.normal;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: isNormal
              ? EdgeInsets.only(
                  top: kToolbarHeight,
                  left: Insets.lg,
                  right: Insets.lg,
                )
              : EdgeInsets.only(
                  top: kToolbarHeight,
                  left: Insets.xxl,
                  right: Insets.xxl,
                ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flex(
                direction: isNormal ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (isNormal)
                    const SizedBox.shrink()
                  else
                    const GreetingsUserNameSkills(),
                  const UserAvatar(),
                  if (!isNormal)
                    const SizedBox.shrink()
                  else
                    const GreetingsUserNameSkills(),
                  const DownloadResume(),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class GreetingsUserNameSkills extends StatelessWidget {
  const GreetingsUserNameSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Greetings(),
        VSpace.s15,
        const UserName(),
        VSpace.s15,
        const UserProfessions(),
        VSpace.s15,
        if (context.isNormal)
          const SizedBox.shrink()
        else
          const UserFontFacingSocialsMedia(),
      ],
    );
  }
}

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints.tightFor(width: 120),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: theme.colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '👋 Hello there.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserRepositoryImpl().user;
    final theme = Theme.of(context);
    return Column(
      children: <Widget>[
        Text(
          user.firstName,
          style: theme.textTheme.headlineLarge,
        ),
        Text(
          user.lastName,
          style: theme.textTheme.headlineLarge,
        ),
      ],
    );
  }
}

class UserProfessions extends StatelessWidget {
  const UserProfessions({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserRepositoryImpl().user;
    final theme = Theme.of(context);
    return Row(
      children: <Widget>[
        Text(
          user.professions[0],
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
        HSpace.s10,
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.secondary,
          ),
        ),
        HSpace.s10,
        Text(
          user.professions[1],
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        )
      ],
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final width = ResponsiveLayout.value(
      context,
      Breakpoints(
        xs: w * .8,
        sm: w * .4,
        md: w * .3,
        lg: w * .3,
        xl: w * .3,
      ),
    );
    return SizedBox(
      width: width.toDouble(),
      child: SvgPicture.asset(
        'assets/images/svg/cartoon-user-avatar.svg',
      ),
    );
  }
}

class DownloadResume extends StatelessWidget {
  const DownloadResume({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isNormal = context.screenSize == ScreenSize.normal;

    return Flex(
      direction: isNormal ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              'Resume',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.file_download_outlined,
              color: theme.colorScheme.primaryContainer,
            ),
          ],
        ),
        HSpace.s10,
        OutlinedButton(
          onPressed: () {},
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/svg/WhatsappLogo.svg',
              ),
              Text(
                'Chat on Whatsapp',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
