import 'package:flutter/material.dart';
import 'package:notesapp/services/note.dart';

class EditNote extends StatelessWidget {
  late Note note;

  EditNote({Key? key, required this.note}) : super(key: key);

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
                  onPressed: ()=> saveNote(), //Do something
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
                initialValue: note.title,
              ),

              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Content',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autofocus: false,
                initialValue: note.content,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveNote(){

  }
}
