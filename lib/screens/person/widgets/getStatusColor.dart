
import 'package:flutter/material.dart';
import 'package:flutter_application_37/const/commands.dart';

getStatusColor(String status) {
  switch (status) {
    case 'Alive':
      return ThemeHelper.green;

    case 'Dead':
      return ThemeHelper.red;

    default:
      return ThemeHelper.black;
  }
}

