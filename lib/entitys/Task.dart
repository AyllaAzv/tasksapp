class Task {
  int id;
  String title;
  String description;
  String image;

  Task({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  Task.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    image = map['image'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}