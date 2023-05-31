// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String firstName;
  final String lastName;
  final List<String> professions;
  final Map<String, String> frontFacingSocialsMedia;
  User({
    required this.firstName,
    required this.lastName,
    required this.professions,
    required this.frontFacingSocialsMedia,
  });
}
