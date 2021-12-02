import 'package:flutter/material.dart';
import 'package:ipl_app/app_data.dart';
import './screens/player_details_screen.dart';
import './screens/settings_screen.dart';
import './screens/tabs_screen.dart';
import './screens/team_players_screen.dart';
import './models/player.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _filters = ["Batsman", "Bowler", "All-Rounder"];

  List<Player> _availablePlayers = Players;

  List<Player> _myTeam = [];

  void _setFilters(List<String> filtersData) {
    setState(() {
      _filters = filtersData;
      print(_filters);

      if (_filters.isEmpty) {
        _availablePlayers = Players;
      } else {
        _availablePlayers = Players.where((player) {
          if (_filters.contains("Batsman") && (player.role == "Batsman")) {
            return true;
          }
          if (_filters.contains("Bowler") && (player.role == "Bowler")) {
            return true;
          }
          if (_filters.contains("All-Rounder") &&
              (player.role == "All-Rounder")) {
            return true;
          }
          return false;
        }).toList();
      }
    });
  }

  void togglePlayerInMyTeam(String playerId) {
    var isPlayerExist = _myTeam.indexWhere((player) {
      return player.id == playerId;
    });

    if (isPlayerExist >= 0) {
      setState(() {
        _myTeam.removeAt(isPlayerExist);
      });
    } else {
      setState(() {
        _myTeam.add(Players.firstWhere((player) {
          return player.id == playerId;
        }));
      });
    }
  }

  bool isInMyTeam(String playerId) {
    return _myTeam.any((player) => player.id == playerId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        primaryColor: Color.fromRGBO(26, 60, 140, 1),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline1: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontSize: 15.0,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(_myTeam),
        TeamPlayersScreen.routeName: (ctx) =>
            TeamPlayersScreen(_availablePlayers),
        SettingsScreen.routeName: (ctx) =>
            SettingsScreen(_filters, _setFilters),
        PlayerDetailsScreen.routeName: (ctx) =>
            PlayerDetailsScreen(togglePlayerInMyTeam, isInMyTeam),
      },
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("IPL 2021")),
//       body: GridView(
//         padding: EdgeInsets.all(20),
//         children: Teams.map((team) {
//           return TeamItem(
//             id: team.id,
//             name: team.name,
//             abbrv: team.abbrv,
//             jerseyColor: team.jerseyColor,
//           );
//         }).toList(),
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 250,
//           childAspectRatio: 12 / 10,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20,
//         ),
//       ),
//     );
//   }
// }
