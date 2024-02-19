import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/isloate_send_receive.dart';
import 'package:flutter_tutorial/isolate_run.dart';
import 'package:flutter_tutorial/without_isolate.dart';

late ReceivePort receivePortGlobal;

void spawnIsolate({required ReceivePort receivePort}) async {
  Isolate.spawn<SendPort>((sendPort) {
    _heavyTask();
    sendPort.send("Hello");
  }, receivePort.sendPort);
}

void _heavyTask() {
  int count = 0;
  for (var i = 0; i < 2000000000; i++) {
    count++;
  }
  print("Counter From Isolate = $count");
}

void main() {
  receivePortGlobal = ReceivePort();
  receivePortGlobal.listen((message) {
    print('Received: $message');
  });
  spawnIsolate(receivePort: receivePortGlobal);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IsolateRun(
                      title: "IsolateRun",
                    ),
                  ),
                );
              },
              child: const Text('Isolate Run'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IsolateSpawn(
                      title: "Isolate Spawn",
                    ),
                  ),
                );
              },
              child: const Text('Isolate Spawn'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WithoutIsolate(
                      title: "Without Isolate",
                    ),
                  ),
                );
              },
              child: const Text('Without Isolate'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
