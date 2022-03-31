import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String _github = "https://github.com/kodeaqua/mobpro-tugas2";

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
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
      title: 'Tugas 2 Mobile Programming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tugas 2 Mobile Programming'),
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
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Eits.. mau kemana?",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                  );
                },
              ),
              title: const Text(
                'Profil saya',
                style: TextStyle(
                    fontFamily: "Montserrat", fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'Tentang aplikasi',
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600),
                              ),
                              content: const Text(
                                  'Ini adalah improved version dari https://github.com/kodeaqua/prak-mobpro-tugas1'),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Tutup'),
                                    child: const Text('Tutup'))
                              ],
                            ));
                  },
                  icon: const Icon(Icons.info_outline_rounded),
                  tooltip: MaterialLocalizations.of(context).alertDialogLabel,
                )
              ],
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 32)),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('images/me.png'),
                            maxRadius: 60,
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 6, bottom: 6)),
                        const Text(
                          "Adam Najmi Zidan",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 3, bottom: 3)),
                        const Text(
                          "adam.065119079@unpak.ac.id",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 6, bottom: 6)),
                        const HomeCard(),
                        const HomeCard(),
                        Card(
                            elevation: 3,
                            color: const Color(0xff448AFF),
                            child: Container(
                                width: 320,
                                padding: const EdgeInsets.all(24),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.storage_outlined,
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 24)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "GitHub",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 3, bottom: 3)),
                                        const Text(
                                          "https://github.com/kodeaqua",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 3, bottom: 3)),
                                        ElevatedButton(
                                          onPressed: _launchURL,
                                          child: const Text(
                                            'Repositori',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        color: const Color(0xff448AFF),
        child: Container(
            width: 320,
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                const Icon(
                  Icons.perm_identity_outlined,
                  color: Colors.white,
                ),
                const Padding(padding: EdgeInsets.only(right: 24)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Nomor Pokok Mahasiswa",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(top: 3, bottom: 3)),
                    Text(
                      "065119079",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            )));
  }
}
