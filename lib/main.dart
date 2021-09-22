import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Pessoas no Show",
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _textPeople = "Pode Entrar!";

  void _alterPeople(int pes){
    setState(() {
      _people += pes;

      if (_people >= 10) {
        _textPeople = "Lotado!";
        _people = 10;
      }else {
        _textPeople = "Pode Entrar!";
      }

      if (_people <= 0 ){
        _people = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Image.asset("image/balada.jpg", fit: BoxFit.cover, height: 2048),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total = $_people",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(10),
                    child: FlatButton(
                      onPressed: () {
                        _alterPeople(1);
                      },
                      child: Text("+1", style: TextStyle(color: Colors.white, fontSize: 30),),
                    )
                ),
                Padding(padding: EdgeInsets.all(10),
                  child: FlatButton(
                    onPressed: () {
                      _alterPeople(-1);
                    },
                    child: Text("-1", style: TextStyle(color: Colors.white, fontSize: 30),),
                  ),
                )
              ],
            ),
            Text("$_textPeople"),
          ],
        )
      ]
    );
  }
}
