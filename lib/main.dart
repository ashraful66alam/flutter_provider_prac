import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prac/providers/text_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TextProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 150, 183, 58)),
          useMaterial3: true,
        ),
        home: const FirstRoute(),
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(context.watch<TextProvider>().value),
            ElevatedButton(
              child: const Text('Open route'),
              onPressed: () {
                // Navigate to second route when tapped.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  final myController = TextEditingController();

//  @override
//   void initState() {
//     super.initState();

//     // Start listening to changes.
//     myController.addListener(context.watch<TextProvider>().add(myController.text));
//   }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                context.read<TextProvider>().add(myController.text);
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Add Task',
              ),
              controller: myController,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
            FloatingActionButton(
              // When the user presses the button, show an alert dialog containing
              // the text that the user has entered into the text field.
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text(myController.text),
                    );
                  },
                );
              },
              tooltip: 'Show me the value!',
              child: const Icon(Icons.text_fields),
            )
          ],
        ),
      ),
    );
  }
}
