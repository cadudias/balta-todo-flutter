import 'package:flutter/material.dart';
import 'package:todo/models/item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = List<Item>();

  HomePage() {
    items = [];
    items.add(Item(title: "item 1", done: true));
    items.add(Item(title: "item 2", done: false));
    items.add(Item(title: "item 3", done: false));
    items.add(Item(title: "item 4", done: true));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  void add() {
    var todo = newTaskCtrl.value;

    if (todo.text.isEmpty) return;

    setState(() {
      widget.items.add(Item(title: todo.text, done: false));
    });

    newTaskCtrl.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextFormField(
        controller: newTaskCtrl,
        keyboardType: TextInputType.text, // tipos de teclados
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          labelText: "Digite a tarefa",
          labelStyle: TextStyle(color: Colors.white),
        ),
      )),
      body: ListView.builder(
        itemCount: widget.items.length, // total de iemno widget HomePage
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];

          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              setState(() {
                print(value);
                item.done = value;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
