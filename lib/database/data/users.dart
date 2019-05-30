class Users {
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnEmail = 'email';

  int id;
  String name;
  String email;

  Users({this.id, this.name, this.email});

  factory Users.fromMap(Map<String, dynamic> json) => new Users(
        id: json[columnId],
        name: json[columnName],
        email: json[columnEmail],
      );

  Map<String, dynamic> toMap() => {
        columnId: id,
        columnName: name,
        columnEmail: email,
      };
}
