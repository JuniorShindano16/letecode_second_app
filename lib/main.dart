import 'package:flutter/material.dart';
import 'package:todo_management/themeTodo/darkTheme.dart';
import 'package:todo_management/themeTodo/ligthTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController todoController = TextEditingController();
  List<String> todo = [

    "learn flutter",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List", style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column( spacing: 20,
          children: [
            Row( spacing: 20,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.5,

                  child: TextField(controller: todoController,
                    decoration: InputDecoration(
                      hintText: 'Task name',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (todoController.text==""){
                      print ("Saisir quelque chose");
                    } else {

                      setState(() {
                        todo.add(todoController.text);
                        todoController.text="";
                      });
                    }
                  },
                  child: Text(
                    "Add task",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: todo.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 50,
                    margin:EdgeInsets.all(10) ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        todo[index],
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
