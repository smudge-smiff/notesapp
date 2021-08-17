import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/pages/editNote.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/services/NotesDatabase.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color yellow = Color(0xffF3DFA2);
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNotes();
  }
  Future loadNotes() async {
    setState(() => isLoading = true);
    this.notes = await NotesDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    //loadNotes();
    return Scaffold(
      //backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Notes'),
        //backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: isLoading ?  CircularProgressIndicator() : displayNotes(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateEditPage(Note(title: '', content: ''));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget displayNotes() => ListView.builder(
    itemCount: notes.length,
    padding: EdgeInsets.all(10),
    itemBuilder: (context, index) {
      return Card(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 12.5),
        //color: yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: ListTile(
                title: Text(notes[index].title),
                subtitle: Text(notes[index].content),
              ),
            ),

            Divider(
              height: 0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    navigateEditPage(notes[index]);
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.copy,
                    size: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    int? id = notes[index].id;
                    deleteNote(id!);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 18,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
  
  void navigateEditPage(Note note) {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) =>
      new EditNote(note: note),
    );
    Navigator.of(context).push(route);
  }
  void deleteNote(int id){
    NotesDatabase.instance.delete(id);
  }
}



/*
ListView.builder(
        itemCount: notes.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 12.5),
            //color: yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: ListTile(
                    title: Text(notes[index].title),
                    subtitle: Text(notes[index].content),
                  ),
                ),

                Divider(
                  height: 0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        navigateEditPage(notes[index]);
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.copy,
                        size: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        size: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
 */
