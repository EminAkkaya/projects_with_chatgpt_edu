import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo/models/todo_status.dart';
import 'package:mvvm_provider_todo/viewmodels/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool showDescriptionField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.green[100]!],
          ),
        ),
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TodosText(),
              Row(
                children: [
                  Expanded(child: TextField(controller: titleController)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showDescriptionField = !showDescriptionField;
                      });
                    },
                    icon: Icon(Icons.description),
                    color: Colors.blue[400],
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<TodoViewModel>().addTodo(
                        titleController.text,
                        description: showDescriptionField == false
                            ? null
                            : descriptionController.text,
                      );
                      titleController.clear();
                      descriptionController.clear();
                    },
                    icon: Icon(Icons.add),
                    color: Colors.green[600],
                  ),
                ],
              ),
              if (showDescriptionField)
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(hintText: "Description"),
                ),

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<TodoViewModel>().changeFilter(
                        FilterType.all,
                      );
                    },
                    child: Text("All"),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<TodoViewModel>().changeFilter(
                        FilterType.done,
                      );
                    },
                    child: Text("Done"),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<TodoViewModel>().changeFilter(
                        FilterType.pending,
                      );
                    },
                    child: Text("Pending"),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: context
                      .watch<TodoViewModel>()
                      .filteredTodos
                      .length,
                  itemBuilder: (context, index) {
                    final todo = context
                        .watch<TodoViewModel>()
                        .filteredTodos[index];
                    return Dismissible(
                      key: Key(todo.getTitle),
                      onDismissed: (direction) {
                        context.read<TodoViewModel>().removeTodo(todo.id);
                      },
                      child: ListTile(
                        leading: Checkbox(
                          value: todo.isDone,
                          onChanged: (value) {
                            context.read<TodoViewModel>().toggleTodo(todo.id);
                          },
                        ),
                        title: Text(todo.getTitle),
                        trailing: todo.description != null
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    todo.toggleShowDescription();
                                  });
                                },
                                icon: Icon(
                                  Icons.description,
                                  color: Colors.green[600],
                                ),
                              )
                            : SizedBox(),
                        subtitle: todo.showDescription == true
                            ? Text(todo.description!)
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodosText extends StatelessWidget {
  const TodosText({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [Colors.blue[400]!, Colors.green[600]!],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ).createShader(bounds);
      },
      child: Text(
        "TODOS",
        style: Theme.of(
          context,
        ).textTheme.displayLarge!.copyWith(color: Colors.white),
      ),
    );
  }
}
