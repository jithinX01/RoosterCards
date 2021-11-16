import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';
import 'package:rooster_cards/vault/trophy_card.dart';
import 'package:rooster_cards/utilities/global_user_data_info.dart';

class TrophyCabinet extends StatefulWidget {
  TrophyCabinet({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _TrophyCabinetState createState() => _TrophyCabinetState();
}

class _TrophyCabinetState extends State<TrophyCabinet> {
  List<TrophyData> _trophyList = [];
  @override
  void initState() {
    //_trophyList = _getTrophyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _trophyList = _getTrophyData();
    return Scaffold(
      body: Container(
        child: _trophyList.length > 0
            ? ListView.separated(
                itemCount: _trophyList.length,
                itemBuilder: _itemBuilder,
                separatorBuilder: _separatorBuilder,
              )
            : _noTrophy(),
      ),
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return Divider();
  }

  Widget _itemBuilder(BuildContext context, int index) {
    TrophyData data = _trophyList[index];
    return TrophyCard(
      wonPlayers: data.trophyWinners,
      tournamentName: data.tournamentName,
      trophyId: data.trophyId,
      sharedTrophy: data.shared,
    );
  }

  Widget _noTrophy() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16.0),
      child: Text("No Trophy, Play Tournament to Win One"),
    );
  }

  List<TrophyData> _getTrophyData() {
    List<TrophyData> trophyList = [];
    var dirPath = UserDataInfo.of(context).userInfo.trophyDir;
    var list = Directory('$dirPath').listSync();
    list.forEach((entity) {
      if (entity is File) {
        var data = entity.readAsBytesSync();
        trophyList.add(TrophyData.fromBuffer(data));
      }
    });
    return trophyList;
  }
}
