import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 10, 2, 36)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Circular counter'),
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
int _counter = 0;
    void _decrementCounter() {
      setState(() {
        _counter--;
        if (_counter < 0) {
        _counter = 10;
      }
      });
    }
     void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter > 10) {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70,
                  width: 170,
                  child: ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text("Decrease"),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: const Color.fromARGB(255, 69, 65, 122),
                    foregroundColor: Colors.white, 
                  ),
                ),
                ),
                SizedBox(width: 30,),
                SizedBox(
                  height: 70,
                  width: 170,
                  child:ElevatedButton(  
                  onPressed: _incrementCounter,
                  child: Text("Increase"),
                  style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize:20),
                  backgroundColor: const Color.fromARGB(255, 69, 65, 122),
                  foregroundColor: Colors.white, 
                 ),
                 ),
                ),
                
              ],
            ),
          ],
        ),
      ),
  );}
}
