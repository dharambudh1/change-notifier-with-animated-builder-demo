import 'dart:developer';

import 'package:change_notifier_demo/model.dart';
import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
  static final Controller _singleton = Controller._internal();

  factory Controller() {
    return _singleton;
  }

  Controller._internal();
  final List<Model> modelList = [];

  void addData(Model value) {
    log('Adding ${value.name} to list.');
    modelList.add(value);
    notifyListeners();
    return;
  }

  void removeData(Model value) {
    log('Removing ${value.name} from list.');
    modelList.remove(value);
    notifyListeners();
    return;
  }
}
