import 'package:flutter/material.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/services/NotesDatabase.dart';
import 'package:notesapp/pages/home.dart';

class EditNote extends StatefulWidget {

  late Note note;

  EditNote({Key? key, required this.note, newNote}) : super(key: key);

  @override
  _EditNoteState createState() => _EditNoteState(note);
}

class _EditNoteState extends State<EditNote> {
  late Note noteRead;
  _EditNoteState(this.noteRead);

  bool newNote = true;

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState(){
    titleController.text = noteRead.title;
    contentController.text = noteRead.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Notes - Edit Note'),
          elevation: 0,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: ()=> saveNote(noteRead, titleController.text, contentController.text), //Do something
                  icon: Icon(
                    Icons.save,
                    size: 18,
                  ),
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10,0,10,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Title',
                  //border: InputBorder.none,
                ),
                keyboardType: TextInputType.name,
                maxLines: 1,
                autofocus: false,
                //initialValue: note.title,
                controller: titleController,
              ),

              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Content',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autofocus: false,
                //initialValue: note.content,
                controller: contentController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveNote(Note note, String title, String content) async {
    if (note.id != null) {
      Note newNote = Note(id: note.id, title: title, content: content);
      print('id not null');
      await NotesDatabase.instance.update(newNote);
    } else {
      Note newNote = Note(title: title, content: content);
      print('id null');
      await NotesDatabase.instance.create(newNote);
    }
    Navigator.pop(context);
  }
}

