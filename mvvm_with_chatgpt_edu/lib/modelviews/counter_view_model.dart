import 'package:flutter/material.dart';
import 'package:mvvm_with_chatgptedu/models/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel counterModel;

  CounterViewModel(this.counterModel);

  void increment() {
    counterModel.increment();
    notifyListeners();
  }

  int get value => counterModel.value;
}
