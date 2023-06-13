import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/controller/controllernotifer.dart';
import 'package:todo_riverpod/model/todomodel.dart';

final todorivProvider =
    StateNotifierProvider<Todolistnotifer, List<Todomodel>>((ref) {
  return Todolistnotifer();
});
