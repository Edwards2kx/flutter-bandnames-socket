import 'dart:html';

import 'package:flutter/material.dart';
import 'package:udemy_avanzado_1/models/band.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 4),
    Band(id: '2', name: 'Slipknot', votes: 2),
    Band(id: '3', name: 'Aerosmith', votes: 3),
    Band(id: '4', name: 'Korn', votes: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: Icon(Icons.add),
        elevation: 1.0,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      //confirmDismiss: true,
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete Band', style: TextStyle(color: Colors.white)),
        ),
      ),
      onDismissed: (direction) {
          print('direccion $direction');
          print('Band id ${band.id}');
      },
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(band.name.substring(0, 2)),
          ),
          title: Text(band.name),
          trailing: Text(
            band.votes.toString(),
            style: TextStyle(fontSize: 20.0, color: Colors.blue),
          ),
          onTap: () {
            print(band.name);
          }),
    );
  }

  addNewBand() {
    final textController = new TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add new Band'),
            actions: [
              MaterialButton(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  addBandToList(textController.text);
                },
              )
            ],
            elevation: 5.0,
            content: TextField(
              controller: textController,
            ),
          );
        });
  }

  void addBandToList(String name) {
    print(name);
    if (name.length > 1) {
      this.bands.add(Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
