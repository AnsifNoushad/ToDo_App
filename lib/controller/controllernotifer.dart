import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/todomodel.dart';

class Todolistnotifer extends StateNotifier<List<Todomodel>> {
  Todolistnotifer() : super([]);

  void addlist(String data) {
    Todomodel newdata = Todomodel(data: data);
    state = [newdata, ...state];
  }

  void deletelist(int index) {
    state = [
      for (Todomodel i in state)
        if (i.data != state[index].data) i
    ];
  }
}
