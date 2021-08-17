import "dart:io";
import 'package:notesapp/model/note.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${NoteFields.id} $idType, 
  ${NoteFields.title} $textType,
  ${NoteFields.content} $textType
  )
''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db!.insert(tableNotes, note.toJson());
    //final id = await db!.rawInsert("INSERT INTO notes (title, content) VALUES ('${note.title}','${note.content}')");
    print('note created with id: $id');
    return note.copy(id: id);
  }

  Future close() async {
    final db = await instance.database;
    db!.close();
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;
    final maps = await db!.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?', //secure against sql injection
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('id not found');
    }
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    return db!.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${NoteFields.id} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db!.query(tableNotes, orderBy: orderBy);
    print(result.asMap());
    return result.map((json) => Note.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }
}
