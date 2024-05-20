import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Что посмотреть:',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> columnList = [];
  List<String> listViewList = [];
  List<String> listViewSeparatedList = [];
  var currentItem = "";
  int activeListType = 1;

  Future<void> waitServerAns() {
    return Future.delayed(const Duration(seconds: 1));
  }

  void addItemToList(String item, int listType) {
    Future<void> wait = waitServerAns();
    wait.then((value) {
      setState(() {
        switch (listType) {
          case 0:
            columnList.add(item);
            break;
          case 1:
            listViewList.add(item);
            break;
          case 2:
            listViewSeparatedList.add(item);
            break;
        }
      });
    });
  }

  void removeItemFromList(int index, int listType) async{
    await waitServerAns();
    setState(() {
      switch (listType) {
        case 1:
          columnList.removeAt(index);
          break;
        case 2:
          listViewList.removeAt(index);
          break;
        case 3:
          listViewSeparatedList.removeAt(index);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Что посмотреть:'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('Сериалы', //Column List
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Column(
              children: List.generate(columnList.length, (index) {
                return ListTile(
                  tileColor: Colors.greenAccent,
                  title: Text(columnList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      removeItemFromList(index, 1);
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Text('Фильмы', // ListView
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: listViewList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.lightBlue,
                  title: Text(listViewList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      removeItemFromList(index, 2);
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text('Лекции', // ListView.separated
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              itemCount: listViewSeparatedList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.purpleAccent,
                  title: Text(listViewSeparatedList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      removeItemFromList(index, 3);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Добавление названия'),
                content: TextField(
                  onChanged: (value) {
                    currentItem = value;
                  },
                ),
                actions: [
                  TextButton(
                    child: Text('Отмена'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Добавить'),
                    onPressed: () {
                      addItemToList(currentItem, activeListType);
                      Navigator.of(context).pop();
                      currentItem = '';
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeListType,
        onTap: (int index) {
          setState(() {
            // _selectedIndex = index;
            activeListType = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Сериалы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: 'Лекции',
          ),
        ],
      ),
    );
  }
}
