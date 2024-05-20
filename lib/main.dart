import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  var current_color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.red, useMaterial3: true),
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ColorData {
  final Color color;
  final IconData icon;

  ColorData({required this.color, required this.icon});
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var current_color = Colors.yellow;
  var current_icon = Icons.access_alarm;

  void _incrementCounter(int ind) {
    setState(() {
      switch(ind){
        case 1:
          current_color = Colors.yellow;
          break;
        case 2:
          current_color = Colors.green;
          break;
        case 3:
          current_color = Colors.red;
          break;
        case 4:
          current_icon = Icons.access_alarm;
          break;
        case 5:
          current_icon = Icons.accessibility;
          break;
        case 6:
          current_icon = Icons.account_box_sharp;
          break;
      }
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,

        title: Text("Выбор иконки",),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _incrementCounter(1);
                    },
                    style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(100,50))),
                    child: Text('Yellow', style: TextStyle(color: Colors.yellow),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _incrementCounter(2);
                    },
                    style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(100,50))),
                    child: Text('Green',  style: TextStyle(color: Colors.green)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _incrementCounter(3);
                    },
                    style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(100,50))),
                    child: Text('Red', style: TextStyle(color: Colors.red)),
                  ),
                ]
            ),
            Icon(current_icon, color: current_color, size: 52,),
            const Text(
              'Вы поменяли иконку:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              ' раз',
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _incrementCounter(4);
                    },
                    style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(100,50))),
                    child: Icon(Icons.access_alarm),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _incrementCounter(5);
                    },
                    style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(100,50))),
                    child: Icon(Icons.accessibility),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _incrementCounter(6);
                    },
                    style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(100,50))),
                    child: Icon(Icons.account_box_sharp),
                  ),]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _counter = 0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen(colorData: ColorData(color: current_color, icon: current_icon))),
                      );
                    },
                    style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(80,50))),
                    child: Text('Choose It!', style: TextStyle(color: Colors.purple),),
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {

  final ColorData colorData;

  SecondScreen({required this.colorData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You choose:'),
      ),
      body: Center(
          child: Icon(colorData.icon, color: colorData.color, size: 150,)
      ),
    );
  }
}
