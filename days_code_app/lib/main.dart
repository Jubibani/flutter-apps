  import 'package:flutter/material.dart';
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
  //function for asking did you miss a day?
  void missedDay () {

  }


  class _MyHomePageState extends State<MyHomePage> {
    int _counter = 0;

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
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
                _resetCounter();
                Navigator.of(context).pop(); // Close the dialog
                _showMissedDayDialog(context);
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
    void _showMissedDayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const  Text('Awwww man, Streak Lost.'),
          content: const Text('You missed a day! revert to 0'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('ok'),
            ),
          ],
        );
      },
    );
  }
    void cantDecrement() {
      if (_counter <= 0) {
          setState(() {
            _counter = 0;
            showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title:const  Text("Rocky, There is no tomorrow!"),
            content: const Text('no day to decerement...'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              child: const Text('ok'),
            ),
          ],
        );
      },
    );
        });
      }
    }
    void decrementCounter() {
      setState(() {
        _counter--;
      });
    }
    void incrementCounter() {
      setState(() {
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
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
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
        floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              decrementCounter();
              cantDecrement();
            },
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
