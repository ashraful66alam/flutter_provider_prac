import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prac/providers/todolist_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodolistProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 150, 183, 58)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Provider Practice'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  String counter = 'new';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // indicatorColor: Colors.amber,
        indicatorColor: Theme.of(context).colorScheme.primary,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Page 1',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications_sharp),
            icon: Icon(Icons.notifications_outlined),
            label: 'Page 2',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const Widget1(),
        const Widget2(),

        /// Notifications page
      ][currentPageIndex],
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Widget2 extends StatelessWidget {
  const Widget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = context.watch<TodolistProvider>().todos;
    return ListView(
      children: [
        for (var i in data)
          Card(
            shadowColor: Theme.of(context).colorScheme.primary,
            margin: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(i.toString()),
            ),
          )
      ],
    );
  }
}

class Widget1 extends StatelessWidget {
  const Widget1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = context.watch<TodolistProvider>().todos;
    return ListView(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'New Task',
          ),
        ),
        for (var i in data)
          Card(
            shadowColor: Theme.of(context).colorScheme.secondary,
            margin: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(i.toString()),
            ),
          )
      ],
    );
  }
}
