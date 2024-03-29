import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/todo_viewmodel.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<TodoViewModel>(context);

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text("TODO LIST"),
        ),
        body: Form(
          key: formKey,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: todocontroller.titlecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.red),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Title",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: todocontroller.descriptioncontroller,
                    minLines: 3,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.red),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Description",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      todocontroller.createTodo();
                    }
                  },
                  child: Container(
                    width: 400,
                    height: 55,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Center(
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
