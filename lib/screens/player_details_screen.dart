import 'package:flutter/material.dart';
import '../models/player.dart';
import '../app_data.dart';

class PlayerDetailsScreen extends StatelessWidget {
  static const routeName = "/player-details";
  final Function toggleMyTeamPlayer;
  final Function isInMyTeam;

  PlayerDetailsScreen(this.toggleMyTeamPlayer, this.isInMyTeam);

  Widget buildSectionTitle(context, String title, Color barColor) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          barColor,
          barColor.withOpacity(0.5),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 50,
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Widget buildStatsField(context, fields, Color barColor) {
    return Column(
      children: [
        ...fields.map((key) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: barColor,
            width: 150,
            height: 35,
            alignment: Alignment.center,
            child: Text(
              key.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          );
        }).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final playeId = routeArgs['playerId'];
    final Color barColor = routeArgs['barColor'];

    final Player playerDetails = Players.firstWhere((player) {
      return player.id == playeId;
    });

    final statsKeys = playerDetails.iplStats.keys;
    final statsValues = playerDetails.iplStats.values;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: barColor,
        title: Text(
          playerDetails.name,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: barColor.withOpacity(0.2),
              ),
              width: double.infinity,
              height: 250,
              alignment: Alignment.bottomCenter,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      barColor,
                      barColor.withOpacity(0.5),
                    ]),
                  ),
                  width: 200,
                  height: 250,
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    playerDetails.profileImg,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 5,
            ),
            buildSectionTitle(context, playerDetails.role, barColor),
            buildSectionTitle(context, "IPL Stats", barColor),
            Container(
              decoration: BoxDecoration(
                  color: barColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildStatsField(context, statsKeys, barColor),
                  buildStatsField(
                      context, statsValues, barColor.withOpacity(0.5)),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: barColor,
        child: Icon(
          isInMyTeam(playeId)
              ? Icons.person_remove_rounded
              : Icons.person_add_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          toggleMyTeamPlayer(playeId);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
