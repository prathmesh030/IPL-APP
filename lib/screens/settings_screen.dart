import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  final List<String> currentFilters;
  final Function saveFilters;
  SettingsScreen(this.currentFilters, this.saveFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _isBowler;
  var _isBatsman;
  var _isAllRounder;

  Widget _buildSwitchTile(bool currentValue, Function updateValue,
      String titleTxt, String subtitleTxt) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(
        titleTxt,
        style: Theme.of(context).textTheme.headline1,
      ),
      subtitle: Text(subtitleTxt),
    );
  }

  @override
  void initState() {
    if (widget.currentFilters.contains("Batsman")) {
      _isBatsman = true;
    } else {
      _isBatsman = false;
    }

    if (widget.currentFilters.contains("Bowler")) {
      _isBowler = true;
    } else {
      _isBowler = false;
    }

    if (widget.currentFilters.contains("All-Rounder")) {
      _isAllRounder = true;
    } else {
      _isAllRounder = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                setState(() {
                  List<String> filterData = [];
                  if (_isBowler) {
                    filterData.add("Bowler");
                  }
                  if (_isBatsman) {
                    filterData.add("Batsman");
                  }
                  if (_isAllRounder) {
                    filterData.add("All-Rounder");
                  }
                  // print(filterData);
                  widget.saveFilters(filterData);
                });
              })
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              child: Center(
                child: Text(
                  "Filter Players",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            _buildSwitchTile(
              _isBatsman,
              (newvalue) {
                setState(() {
                  _isBatsman = newvalue;
                });
              },
              "Show Batsmen",
              "Only batsmen will display",
            ),
            _buildSwitchTile(
              _isBowler,
              (newvalue) {
                setState(() {
                  _isBowler = newvalue;
                });
              },
              "Show Bowlers",
              "Only bowlers will display",
            ),
            _buildSwitchTile(
              _isAllRounder,
              (newvalue) {
                setState(() {
                  _isAllRounder = newvalue;
                });
              },
              "Show All-Rounders",
              "Only all-rounders will display",
            ),
          ],
        ),
      ),
    );
  }
}
