import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IsolateRun extends StatefulWidget {
  const IsolateRun({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<IsolateRun> createState() => _IsolateRunState();
}

class _IsolateRunState extends State<IsolateRun> {
  int _counter = 0;

  void _incrementCounter() async {
    _counter = await _incrementWithIsolate(_counter);
    setState(() {
      _counter++;
    });
  }

  // This function is used to increment the counter with isolate.
  // It is used to run the code in a separate thread to avoid blocking the main thread.
  // As you can see this will not bloc the loader and the UI will be responsive.
  Future<int> _incrementWithIsolate(int count) {
    return Isolate.run<int>(() {
      for (var i = 0; i < 2000000000; i++) {
        count++;
      }
      return count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            //To show ui rendering in progress.
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
