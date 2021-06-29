import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Parametre {
  String depart;
  String arrive;
  Parametre(this.depart, this.arrive);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Application flutter test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Application test 1'),
        routes: <String, WidgetBuilder>{
          '/activite2': (BuildContext context) => Activite2(title: 'Activite2'),
        });
  }
}

class Activite2 extends StatefulWidget {
  Activite2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Activite2State createState() => Activite2State();
}

class Activite2State extends State<Activite2> {
  List<String> a = ["10h15", "11h25"];
  List<String> b = ["10h15", "11h25", "21h30"];
  List<String> c = ["10h15", "11h25", "23h00"];
  List<String> d = ["10h15", "11h25", "22h00, 13h00"];
  List<String> e = ["10h15", "11h25", "22h00,13h00", "4h23", "6h35"];
  var h = Map<String, List<String>>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Parametre;
    String depart = args.depart;
    String arrive = args.arrive;
    String res = "Les horaires de " + depart + "-" + arrive;
    var horairewidget = <Widget>[];
    h["Montpellier-Paris"] = a;
    h["Montpellier-Marseille"] = b;
    h["Paris-Marseille"] = c;
    h["Marseille-Montpellier"] = d;
    h["Paris-Montpellier"] = a;
    h["Marseille-Paris"] = e;
    h["Paris-Toulouse"] = c;
    h["Marseille-Toulouse"] = e;
    String key = depart.trim() + "-" + arrive.trim();
    if (h.containsKey(key)) {
      for (int i = 0; i < h[key]!.length; i++) {
        horairewidget.add(Text(h[key]![i]));
      }
    } else {
      horairewidget.add(Text("Aucun itinéraire trouvé"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(res, style: TextStyle(fontSize: 20)),
              ListView(
                shrinkWrap: true,
                children: horairewidget,
              )
            ]),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controllerdepart = TextEditingController();
  final controllerarrive = TextEditingController();

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
            TextFormField(
              controller: controllerdepart,
              // ignore: deprecated_member_use
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                labelText: 'Ville de départ',
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            TextFormField(
              controller: controllerarrive,
              // ignore: deprecated_member_use
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                labelText: "Ville d'arrivée",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Voulez vous envoyer le formulaire ?'),
                      actions: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          textColor: Colors.blue,
                          onPressed: () {
                            String depart = controllerdepart.text;
                            String arrive = controllerarrive.text;
                            Navigator.pushNamed(context, '/activite2',
                                arguments: Parametre(depart, arrive));
                          },
                          child: Text('Oui'),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          textColor: Colors.blue,
                          onPressed: () {},
                          child: Text('Non'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Valider'),
            )
          ],
        ),
      ),
    );
  }
}
