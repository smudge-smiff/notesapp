final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, content
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String content = 'content';
}

class Note {

  final int? id;
  final String title;
  final String content;

  const Note({
    this.id,
    required this.title,
    required this.content,

  });
  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,
    title: json[NoteFields.title] as String,
    content: json[NoteFields.content] as String,
  );
  Map<String, Object?> toJson() => {//map of the key values displayed above
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.content: content,
  };

  Note copy({
    int? id,
    String? title,
    String? content,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
      );

}