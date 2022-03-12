import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

const String _github = "https://github.com/kodeaqua";

void main() {
  runApp(const MyApp());
}

void _launchURL() async {
  await launch(_github);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.red));
    return MaterialApp(
      title: 'Tugas 1 Prak. Mobpro',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Tugas 1 Prak, Mobpro'),
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
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
            backgroundColor: Colors.red.shade100,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          elevation: 60,
                          child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text("HELLO",
                                          style: TextStyle(fontSize: 32)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 3, right: 3)),
                                      Text("WORLD",
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.only(top: 12, bottom: 6)),
                                  const Text(
                                      "Tugas 1 Praktikum Mobile Programming"),
                                  const Text("Adam Najmi Zidan - 065119079"),
                                  const Padding(
                                      padding:
                                          EdgeInsets.only(top: 6, bottom: 12)),
                                  Row(
                                    children: [
                                      const ElevatedButton(
                                        onPressed: _launchURL,
                                        child: Text('Repo'),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(
                                              left: 3, right: 3)),
                                      ElevatedButton(
                                        onPressed: () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: const Text('Hi!'),
                                                  content: const Text(
                                                      'Hi Ka Amal dan Kak Sandy!!'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Tutup'),
                                                        child:
                                                            const Text('Tutup'))
                                                  ],
                                                )),
                                        child: const Text("Greeting"),
                                      )
                                    ],
                                  ),
                                ],
                              )))
                    ],
                  ),
                ],
              ),
            )));
  }
}
