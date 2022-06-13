import 'package:flutter/material.dart';

class SettingsMain extends StatefulWidget {
  const SettingsMain({ Key? key }) : super(key: key);

  @override
  State<SettingsMain> createState() => _SettingsMainState();
}

class _SettingsMainState extends State<SettingsMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(actions: [Icon(Icons.arrow_back)]),
    );
  }
}