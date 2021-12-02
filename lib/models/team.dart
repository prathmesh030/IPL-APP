import 'package:flutter/material.dart';

class Team {
  final String id;
  final String abbrv;
  final String name;
  final String imgUrl;
  final Color jerseyColor;

  const Team({
    @required this.id,
    @required this.abbrv,
    @required this.name,
    @required this.imgUrl,
    this.jerseyColor = Colors.black,
  });
}
