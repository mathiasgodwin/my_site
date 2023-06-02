// TODO: Put public facing types in this file.

import './model/user.dart';
export './model/model.dart';

abstract class UserRepository {
  User get user;
}

class UserRepositoryImpl implements UserRepository {
  @override
  User get user => User(
        firstName: 'Godwin',
        lastName: 'Mathias',
        professions: ['Mobile Developer', 'Technical Writer'],
        frontFacingSocialsMedia: {
          'github': 'https://github.com/mathiasgodwin',
          'linkedIn': 'https://linkedin.com/in/mathiasgodwin',
          'dev': 'https://dev.to/mathiasgodwin',
        },
      );
}
