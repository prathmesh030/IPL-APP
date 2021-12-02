import 'package:flutter/foundation.dart';

class Player {
  final String id;
  final String name;
  final String role;
  final String price;
  final String country;
  final String countryName;
  final String profileImg;
  final int jerseyNo;
  final String teamId;
  final Map<String, dynamic> iplStats;

  const Player({
    @required this.id,
    @required this.name,
    @required this.role,
    @required this.price,
    @required this.country,
    @required this.countryName,
    @required this.profileImg,
    @required this.jerseyNo,
    @required this.teamId,
    @required this.iplStats,
  });
}
