import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_data/user_data.dart';

class UserFontFacingSocialsMedia extends StatelessWidget {
  const UserFontFacingSocialsMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserRepositoryImpl().user;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            onPressed: () {}, icon: const Icon(FontAwesomeIcons.linkedin)),
        IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.github)),
        IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.dev)),
      ],
    );
  }
}
