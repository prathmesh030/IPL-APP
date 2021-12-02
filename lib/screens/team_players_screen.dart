import 'package:flutter/material.dart';
import 'package:ipl_app/widgets/player_card.dart';
import '../models/player.dart';

class TeamPlayersScreen extends StatelessWidget {
  static const routeName = "/players";

  final List<Player> players;

  TeamPlayersScreen(this.players);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final teamName = routeArgs['teamName'];
    final barColor = routeArgs['color'];

    final teamId = routeArgs['id'];

    final List<Player> teamPlayers = players.where((player) {
      return player.teamId == teamId;
    }).toList();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: barColor,
          title: Text(teamName),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: teamPlayers.length > 0
              ? Container(
                  child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return PlayerCard(
                      profileImg: teamPlayers[index].profileImg,
                      bgColor: barColor,
                      id: teamPlayers[index].id,
                      country: teamPlayers[index].country,
                      name: teamPlayers[index].name,
                      price: teamPlayers[index].price,
                      role: teamPlayers[index].role,
                      countryName: teamPlayers[index].countryName,
                    );
                  },
                  itemCount: teamPlayers.length,
                ))
              : Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(),
                      child: Image.asset(
                          "assets/images/country_flags/empty-list.png"),
                    ),
                  ],
                ),
        ));
  }
}
