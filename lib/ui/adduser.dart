import 'package:flutter/material.dart';
import 'package:flutter_db_example/database/data/users.dart';
import 'package:flutter_db_example/database/data/usersProvider.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var _usersProvider = UsersProvider();

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  child: TextField(
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(width: 1)),
                        hintText: 'Name'),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  child: TextField(
                    controller: emailController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(width: 1)),
                        hintText: 'Email'),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              addUser();
            },
            child: Container(
              color: Colors.green,
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Add".toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void addUser() {
    if (nameController.text.isEmpty) {
      final snackBar = SnackBar(
        content: Text('Please provide non empty name.'),
        backgroundColor: Colors.red,
      );

      _scaffoldKey.currentState.showSnackBar(snackBar);
      return;
    }

    if (emailController.text.isEmpty) {
      final snackBar = SnackBar(
        content: Text('Please provide non empty email.'),
        backgroundColor: Colors.red,
      );

      _scaffoldKey.currentState.showSnackBar(snackBar);
      return;
    }

    _usersProvider
        .insert(Users(name: nameController.text, email: emailController.text))
        .then(
      (value) {
        nameController.text = "";
        emailController.text = "";
        final snackBar = SnackBar(
          content: Text('User was created successfully'),
          backgroundColor: Colors.black,
        );

        _scaffoldKey.currentState.showSnackBar(snackBar);
      },
    ).catchError(
      (error) {
        print('error while creating user: ' + error.toString());
        final snackBar = SnackBar(
          content: Text('Something wrong, please try again.'),
          backgroundColor: Colors.red,
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      },
    );
  }
}
