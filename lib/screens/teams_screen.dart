import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/team_item.dart';

class TeamsScreen extends StatelessWidget {
  static const routeName = "/teams";

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      children: Teams.map((team) {
        return TeamItem(
          id: team.id,
          name: team.name,
          abbrv: team.abbrv,
          jerseyColor: team.jerseyColor,
          imgUrl: team.imgUrl,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 14 / 11,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
