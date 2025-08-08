import 'package:flutter/material.dart';
import 'package:mvvm_with_chatgptedu/modelviews/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterViewModel>(
              builder: (context, counter, child) {
                return Text(counter.value.toString());
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterViewModel>().increment();
              },
              child: Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}


// 1 = Model her bir görevi temsil eden ToDoTileModel adında bir class  olmalı isDone, Title, Description ve ToggleToDo() alanlarını içermeli aynı zamanda ToDoModel olmalı bu ise ToDoTileModel listesi bulundurmalı AddToDo() RemoveToDo() fonksiyonlarına sahip olmalı aynı zamanda filtrelenmiş yada filtrelenmemiş yani view da gösterilecek liste olan ToDoFilteredList adında ToDoTileModel listesi bulundurmalı

// 2 = görevleri döndürme işlemini yapmalı (filtrelemelere göre farklı olacak şekilde) ToDoTileModelin ToogleToDo işlemini uygulayabilmeli notifyListeners ile ui ı değişim halinde bilgilendirmeli

// 3 = Best practice olarak filtre tipi enum listesi ile belirlenmeli filtre tipini state içerisinde tutmalı ui ile değiştirildiğinde bir fonksiyon filtreleme tipi ile birlikte viewmodel yollanmalı 