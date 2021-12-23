import 'package:flutter/material.dart';

import 'Intervals.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> names = <String>[];
  final List<String> times = <String>[];
  final List<String> songs = <String>[];

  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController songController = TextEditingController();

  void addItemToList(Intervals interval){
    setState(() {
      names.add(interval.name);
      times.add(interval.time);
      songs.add(interval.song);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Tutorial - googleflutter.com'),
        ),
        body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),

              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time',
                  ),
                ),

              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: songController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Song',
                  ),
                ),

              ),
              RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  var interval = Intervals(nameController.text, timeController.text,songController.text);
                  addItemToList(interval
                  );
                },
              ),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: names.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          color:Colors.blue[100],
                          child: Center(
                              child: Text('${names[index]} (${times[index]})(${songs[index]})',
                                style: TextStyle(fontSize: 18),
                              )
                          ),
                        );
                      }
                  )
              )
            ]
        )
    );
  }
}

