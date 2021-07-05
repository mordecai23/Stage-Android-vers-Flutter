import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App 2',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Test App 2 '),
        routes: <String, WidgetBuilder>{
          '/Inscription': (BuildContext context) =>
              Inscription(title: 'Inscription'),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controllermail = TextEditingController();
  final controllermdp = TextEditingController();

  /* void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Image(
              height: 50.0,
              width: 500.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://flutter.help/uploads/default/original/1X/fd91b5e04a9ca809fcfe8714e7e63f133129abf3.png'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controllermail,
                  // ignore: deprecated_member_use
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    labelText: 'Adresse mail',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                TextFormField(
                  controller: controllermdp,
                  obscureText: true,
                  // ignore: deprecated_member_use
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: style,
                    onPressed: () {
                      if (controllermail.text.toString().trim() != "" ||
                          controllermail.text.toString().trim() != "") {
                        Navigator.pushNamed(
                          context,
                          '/Home',
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Erreur saisie'),
                              content: Text('Veuillez remplir tous les champs'),
                              actions: [],
                            );
                          },
                        );
                      }
                    },
                    child: Text("Connexion")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/Inscription',
                      );
                    },
                    child: Text(
                      "Inscription",
                      style: TextStyle(fontSize: 15),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Inscription extends StatefulWidget {
  Inscription({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  InscriptionState createState() => InscriptionState();
}

class InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextFormField(
              //controller: controllermail,
              // ignore: deprecated_member_use
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nom',
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            TextFormField(
              //controller: controllermail,
              // ignore: deprecated_member_use
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Prénom',
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            TextFormField(
              //controller: controllermail,
              // ignore: deprecated_member_use
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adresse mail',
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            TextFormField(
              //controller: controllermail,
              // ignore: deprecated_member_use
              obscureText: true,
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mot de passe',
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {},
                child: Text("Inscription")),
          ],
        ),
      ),
    );
  }
}
