import 'package:flutter/material.dart';
import 'package:flutter_db_example/database/data/users.dart';
import 'package:flutter_db_example/database/data/usersProvider.dart';

import 'adduser.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  var _usersProvider = UsersProvider();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder(
        future: _usersProvider.getAll(),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            print("Error while fetching users: " + snapshot.error);
            return placeHolderWidget(
                "You don't have any users yet, \nPlease add some.");
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                return showUsers(snapshot.data);
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget showUsers(List<Users> usersList) {
    if (usersList == null || usersList.length == 0) {
      return placeHolderWidget(
          "You don't have any users yet, \n Please add some.");
    } else {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: stackBehindDismiss(),
                  key: ObjectKey(usersList[index]),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          usersList[index].name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          usersList[index].email,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  onDismissed: (_) {
                    var user = usersList.elementAt(index);
                    //To delete
                    deleteUser(user);
                  },
                );
              },
              itemCount: usersList.length,
            ),
            Container(
              height: 100,
              color: Colors.transparent,
            )
          ],
        ),
      );
    }
  }

  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Widget placeHolderWidget(String message) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }

  void deleteUser(Users user) {
    _usersProvider.delete(user.id).then((value) {
      final snackBar = SnackBar(
        content: Text('User was deleted successfully'),
        backgroundColor: Colors.black,
      );

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }).catchError((error) {
      print('error while deleting user: ' + error.toString());
      final snackBar = SnackBar(
        content: Text('Something wrong, please try again.'),
        backgroundColor: Colors.red,
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    });
  }
}
