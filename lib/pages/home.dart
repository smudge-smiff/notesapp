import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/services/note.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color yellow = Color(0xffF3DFA2);
  List<Note> notes = [
    Note(id:1, title:'hello world 1', content: 'this is a test of the notes app 1 Performing hot restart... Syncing files to device sdk gphone x86...Restarted application in 2,541ms. this is a test of the notes app 1 Performing hot restart... Syncing files to device sdk gphone x86...Restarted application in 2,541ms.'),
    Note(id:2, title:'hello world 2', content: 'this is a test of the notes app 2'),
    Note(id:3, title:'hello world 3', content: 'this is a test of the notes app 3'),
    Note(id:4, title:'hello world 4', content: 'this is a test of the notes app 4'),
    Note(id:5, title:'hello world 5', content: 'this is a test of the notes app 5'),
    Note(id:6, title:'hello world 6', content: 'this is a test of the notes app 6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Notes'),
        //backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: notes.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 12.5),
            //color: yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,5,0,5),
                  child: ListTile(
                    title: Text(notes[index].title),
                    subtitle: Text(notes[index].content),
                  ),
                ),
                Divider(
                  height:0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.edit, size: 18,),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.copy, size: 18,),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.delete, size: 18,),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
