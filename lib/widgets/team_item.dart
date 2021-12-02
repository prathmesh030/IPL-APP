import 'package:flutter/material.dart';
import '../screens/team_players_screen.dart';

class TeamItem extends StatelessWidget {
  final String name;
  final String abbrv;
  final String id;
  final Color jerseyColor;
  final String imgUrl;

  TeamItem({this.id, this.name, this.abbrv, this.jerseyColor, this.imgUrl});

  void viewTeamPlayers(ctx, teamId) {
    Navigator.of(ctx).pushNamed(TeamPlayersScreen.routeName,
        arguments: {'id': teamId, 'teamName': name, 'color': jerseyColor});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        viewTeamPlayers(context, id);
      },
      splashColor: jerseyColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              jerseyColor.withOpacity(0.45),
              jerseyColor.withOpacity(1),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Image.asset(
          imgUrl,
          height: 120,
          width: 120,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
