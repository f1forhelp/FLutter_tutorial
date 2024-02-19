import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tutorial/main.dart';

class IsolateSpawn extends StatefulWidget {
  const IsolateSpawn({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<IsolateSpawn> createState() => _IsolateSpawnState();
}

class _IsolateSpawnState extends State<IsolateSpawn> {
  int _counter = 0;

  ReceivePort _receivePort = ReceivePort();

  void spawnIsolate({required ReceivePort receivePort}) async {
    // Isolate.spawn<SendPort>((sendPort) {
    //   _heavyTask();
    //   sendPort.send("Hello");
    // }, receivePort.sendPort);
  }

  // This function is used to increment the counter with isolate.
  // It is used to run the code in a separate thread to avoid blocking the main thread.
  // As you can see this will not bloc the loader and the UI will be responsive.
  void _heavyTask() {
    int count = 0;
    for (var i = 0; i < 2000000000; i++) {
      count++;
    }
    print("Counter From Isolate = $count");
  }

  @override
  void initState() {
    _receivePort.listen((message) {
      print('Received: $message');
    });
    spawnIsolate(receivePort: receivePortGlobal);

    super.initState();
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
        // onPressed: _incrementCounter,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
