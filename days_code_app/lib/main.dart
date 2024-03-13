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
          colorScheme: ColorScheme.fromSwatch().copyWith(
            background: const Color(0xFF1F2428),            // Add other color scheme properties as needed
          ),
          textTheme: const TextTheme(
            bodyLarge:  TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1F2428),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)
            ),// Other theme properties
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
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1F2428),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container( //Parent Container for the little boxes (days)
                width: 200,
                height: 200,
               decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 35, 38),
                border: Border.all(
                  color: Colors.black,
                  width: 2.5,
                ),
                borderRadius: BorderRadius.circular(18.0),
               ),
                child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 15,
                            height:15,
                            padding: const EdgeInsets.all(10),
                            color: const Color.fromARGB(255, 12, 103, 48),
                          ),
                        ],
                      ),
                    ]
                  ),
              ),
              // const Text(
              //   'your streak:  ',
              // ),
              // Text(
              //   '$_counter',
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
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
