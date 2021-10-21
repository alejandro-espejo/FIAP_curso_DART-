class Tarefa {
  final int? id;
  final String title;
  final String description;

  Tarefa({this.id, required this.title, required this.description});

  factory Tarefa.fromMap(Map map) {
    return Tarefa(
      id : map['id'],
      title : map["title"],
      description : map["description"]
    );
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "title": title,
      "description": description
    };

    if (id != null) {
      map["id"] = id;
    }

    return map;
  }
}
