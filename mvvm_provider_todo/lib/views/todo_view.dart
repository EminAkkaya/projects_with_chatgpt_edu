import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final List<Map<String, dynamic>> mockTodos = [
    {"title": "Buy milk", "isDone": false},
    {
      "title": "Study Flutter",
      "isDone": true,
      "description": "MVVM pattern",
      "showDescription": false,
    },
    {
      "title": "Study Flutter Provider",
      "isDone": false,
      "description": "MVVM pattern",
      "showDescription": false,
    },
    {
      "title": "Study Flutter Riverpod",
      "isDone": true,
      "description": "State management with riverpod sample app",
      "showDescription": false,
    },
  ];

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
                  Expanded(child: TextField()),
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
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.green[600],
                  ),
                ],
              ),
              if (showDescriptionField)
                TextField(decoration: InputDecoration(hintText: "Description")),

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: Text("All")),
                  TextButton(onPressed: () {}, child: Text("Done")),
                  TextButton(onPressed: () {}, child: Text("Pending")),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: mockTodos.length,
                  itemBuilder: (context, index) {
                    final todo = mockTodos[index];
                    return Dismissible(
                      key: Key(todo["title"]),
                      onDismissed: (direction) {},
                      child: ListTile(
                        leading: Checkbox(
                          value: todo["isDone"],
                          onChanged: (value) {},
                        ),
                        title: Text(todo["title"]),
                        trailing: todo["description"] != null
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (todo["showDescription"] != null) {
                                      todo["showDescription"] =
                                          !todo["showDescription"];
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.description,
                                  color: Colors.green[600],
                                ),
                              )
                            : SizedBox(),
                        subtitle: todo["showDescription"] == true
                            ? Text(todo["description"])
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
