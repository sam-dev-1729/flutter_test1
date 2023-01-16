/// models

class User {
  String? name;
  String? id;
  String? phone;
  String? local;
  User({
    this.name,
    this.id,
    this.phone,
    this.local,
  });
}

class Case {
  String? id;
  DateTime? visittedTime;
  Case({this.id, this.visittedTime});
}
