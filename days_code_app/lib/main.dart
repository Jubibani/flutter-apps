  import 'package:flutter/material.dart';
// Define a custom container widget
  class CustomContainer extends StatelessWidget {
    final double width;
    final double height;
    final Color color;
    final Color borderColor;
    final double borderWidth;
    final double borderRadius;

    // Constructor for the CustomContainer class
    const CustomContainer({
      Key key,
      this.width = 20,
      this.height = 20,
      this.color = const Color(0xFF1F2428),
      this.borderColor = Colors.black,
      this.borderWidth = 2.5,
      this.borderRadius = 5.0,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      );
    }
  }


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
  //function for container

  class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key, required this.title});

    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {
    var childGreenBoxVisbility = false;
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
                  _makeGreenBoxDisappear();
                  Navigator.of(context).pop(); // Close the dialog
                  _showMissedDayDialog(context);
                },
                child: const Text('Yes'),
              ),
              TextButton(onPressed: () {
                _incrementCounter();
                _makeGreenBoxAppear();
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
    void _decrementCounter() {
      setState(() {
        if (_counter >= 1) {
          _counter--; 
        } else if (_counter <=0) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title:const  Text("Rocky, There is no tomorrow!"),
                content: const Text('no day to decerement...'),
                actions: [
                TextButton(
                  onPressed: () {
                    _makeGreenBoxDisappear();
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('ok'),
                ),
                ],
              );
            },
          );
        }
      });
    }
    void _incrementCounter() {
      setState(() {
        _counter++;
      });
    }

    void _makeGreenBoxAppear() {
      setState((){
        childGreenBoxVisbility = true;
      });
    }
    void _makeGreenBoxDisappear() {
      setState((){
        childGreenBoxVisbility = false;
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 56, 106, 153),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body:Scaffold(
          body: SafeArea(
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  // Status Container
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 31, 32, 32),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Container( //WinStreak Container
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 34, 132, 76),
                            border: Border.all(
                            color: Colors.black,
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Center(
                             child: Text(
                              _counter.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Container( //WinStreak Container
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 134, 25, 25),
                            border: Border.all(
                            color: Colors.black,
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),     
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Spacing between containers
                Container( // Root Container for ParentContainer(ChildContainer())
                  width: 350,
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 31, 32, 32),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                 child: ListView(
                  children: <Widget> [
                     Row(
                      children: <Widget>[
                        // Instantiate 100 instances of CustomContainer
                        ...List.generate(
                          100,
                          (index) => CustomContainer(),
                        ), 
                      ],
                    ),
                  ],
                 ),
                ),
              ],
            ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  _showMissedDayDialog(context);
                  _decrementCounter();
                  _makeGreenBoxDisappear();
                },
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  _showDialog(context);
                  _makeGreenBoxAppear();
                },              
                child: const Icon(Icons.add),
              ),
            ],
          )
        ),
      // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }
