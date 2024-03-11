  import 'package:flutter/material.dart';
  import 'package:logging/logging.dart';
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
        title: 'My-First Flutter-App',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 1, 1, 2)),
          useMaterial3: true,
        ), 
        home: const MyHomePage(title: '100 Days of Code'),
      );
    }
  }
  class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key, required this.title});

    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
  }

  var logger = Logger('MyLogger');
  //function for asking did you miss a day?
  void missedDay () {

  }


  class _MyHomePageState extends State<MyHomePage> {
    String message = "Missed a day?";
    bool yes = true;
    bool no = false;
    int _counter = 0;
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const  Text('Be Honest...'),
          content: const Text('Did you miss a Day?'),
          actions: [
            TextButton(
              onPressed: () {
                decrementCounter();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Yes'),
            ),
            TextButton(onPressed: () {
              incrementCounter();
              Navigator.of(context).pop();
            }, 
            child: const Text('No')
            )
          ],
        );
      },
    );
  }

    void decrementCounter() {
      setState(() {
        _counter--;
      });
    }
    void incrementCounter() {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        _counter++;
      });
    }
    @override
    Widget build(BuildContext context) {
      // This method is rerun every time setState is called, for instance as done
      // by the _incrementCounter method above.
      //
      // The Flutter framework has been optimized to make rerunning build methods
      // fast, so that you can just rebuild anything that needs updating rather
      // than having to individually change instances of widgets.
      return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'your streak:  ',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
//         floatingActionButton: FloatingActionButton(
        //   onPressed: incrementCounter,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // )
        floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: decrementCounter,
            child: const Icon(Icons.remove)),
          FloatingActionButton(
            onPressed: () {
              _showDialog(context);
            },
            child: const Icon(Icons.add)),
        ])   , // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }
