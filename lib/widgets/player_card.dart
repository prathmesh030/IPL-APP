import 'package:flutter/material.dart';
import '../screens/player_details_screen.dart';

class PlayerCard extends StatelessWidget {
  final String id;
  final String name;
  final String role;
  final String country;
  final String countryName;

  final String price;
  final String profileImg;
  final Color bgColor;
  PlayerCard(
      {this.profileImg,
      this.bgColor,
      this.id,
      this.name,
      this.country,
      this.countryName,
      this.price,
      this.role});

  Widget buildBottomaRowOfCard(imgurl, text, context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imgurl,
            height: 28,
            width: 28,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }

// player details screen
  void goToPlayerDetailsScreen(context, playerid) {
    Navigator.of(context).pushNamed(PlayerDetailsScreen.routeName, arguments: {
      "playerId": playerid,
      "barColor": bgColor,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Players details");
        goToPlayerDetailsScreen(context, id);
      },
      child: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    bgColor,
                    bgColor.withOpacity(0.3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(
                      profileImg,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(24, 5, 5, 0.6),
                              Color.fromRGBO(24, 5, 5, 0.1),
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                ]),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildBottomaRowOfCard(
                          "assets/images/country_flags/role.png",
                          role,
                          context),
                      buildBottomaRowOfCard(country, countryName, context),
                      buildBottomaRowOfCard(
                          "assets/images/country_flags/price.png",
                          price,
                          context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
