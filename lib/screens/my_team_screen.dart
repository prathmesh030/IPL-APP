import 'package:flutter/material.dart';
import '../models/player.dart';
import '../widgets/player_card.dart';

class MyTeamScreen extends StatelessWidget {
  final List<Player> myteamPlayers;
  MyTeamScreen(this.myteamPlayers);
  @override
  Widget build(BuildContext context) {
    if (myteamPlayers.isEmpty) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(),
        child: Image.asset("assets/images/country_flags/empty-list.png"),
      );
    } else {
      return Container(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return PlayerCard(
            profileImg: myteamPlayers[index].profileImg,
            bgColor: Theme.of(context).primaryColor,
            id: myteamPlayers[index].id,
            country: myteamPlayers[index].country,
            name: myteamPlayers[index].name,
            price: myteamPlayers[index].price,
            role: myteamPlayers[index].role,
            countryName: myteamPlayers[index].countryName,
          );
        },
        itemCount: myteamPlayers.length,
      ));
    }
  }
}
