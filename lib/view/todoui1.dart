import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/controller/providerriv.dart';

class Todoapp extends ConsumerWidget {
  Todoapp({super.key});
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var item = ref.watch(todorivProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "Todo app",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text(item[index].data),
            secondary: IconButton(
                onPressed: () {
                  ref.read(todorivProvider.notifier).deletelist(index);
                },
                icon: Icon(Icons.delete)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          opendialog(context, ref);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future opendialog(BuildContext context, WidgetRef ref) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Enter The Content"),
        content: TextField(
          controller: _controller,
        ),
        actions: [
          TextButton(
              onPressed: () {
                String data = _controller.text;
                ref.read(todorivProvider.notifier).addlist(data);
                _controller.clear();
                Navigator.pop(context);
              },
              child: Text("Ok")),
          TextButton(
              onPressed: () {
                _controller.clear();
                Navigator.pop(context);
              },
              child: Text("Cancel")),
        ],
      ),
    );
  }
}
