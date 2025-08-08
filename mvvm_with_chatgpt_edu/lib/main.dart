import 'package:flutter/material.dart';
import 'package:mvvm_with_chatgptedu/models/counter_model.dart';
import 'package:mvvm_with_chatgptedu/modelviews/counter_view_model.dart';
import 'package:mvvm_with_chatgptedu/views/counter_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) {
      final CounterModel counter = CounterModel();
      return CounterViewModel(counter);
    },
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: CounterView());
  }
}
