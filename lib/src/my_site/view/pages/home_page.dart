// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_site/src/util/ui/theme/styles.dart';
import 'package:user_data/user_data.dart';

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: kToolbarHeight,
            left: Insets.lg,
            right: Insets.lg,
          ),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GreetingsUserNameSkills(),
                  UserAvatar(),
                  DownloadResume(),
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class GreetingsUserNameSkills extends StatelessWidget {
  const GreetingsUserNameSkills({Key? key}) : super(key: key);

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
        const UserFontFacingSocialsMedia(),
      ],
    );
  }
}

class Greetings extends StatelessWidget {
  const Greetings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
  const UserName({Key? key}) : super(key: key);

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
  const UserProfessions({Key? key}) : super(key: key);

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

class UserFontFacingSocialsMedia extends StatelessWidget {
  const UserFontFacingSocialsMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserRepositoryImpl().user;

    return Row(
      children: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
      ],
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    return SizedBox(
      width: w * .2,
      child: SvgPicture.asset(
        'assets/images/svg/cartoon-user-avatar.svg',
      ),
    );
  }
}

class DownloadResume extends StatelessWidget {
  const DownloadResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          children: [
            Text(
              'Download Resume',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            Icon(
              Icons.file_download_outlined,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
        FilledButton(
          style: theme.elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStatePropertyAll(
              theme.colorScheme.primaryContainer,
            ),
          ),
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
