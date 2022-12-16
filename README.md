# Flutter Database Example ( sqflite )

A Flutter application, To show the use of sqflite database in flutter with structure. 

|           Adding User To DB           |             Deleting User from DB              |
|------------------------------------|----------------------------------|
|  <img src="https://github.com/UttamPanchasara/FlutterDBExample/blob/master/gif/1_add_user.gif" height="400" alt="Screenshot"/> | <img src="https://github.com/UttamPanchasara/FlutterDBExample/blob/master/gif/2_delete_user.gif" height="400" alt="Screenshot"/> |


## Project is mainly contain two packages

### 1. Database :

  Which contains all the model classes of tables and all other database Helper classes to create and initialiaze database.

### 2. UI :

  Which contains required screens to provide user interface.
  
  
### Important classes of DATABASE :

#### Helper classes

1. **AppDatabaseInfo**: It contains all the database related information.
2. **DBInfo**: An interface to provide all the required database information which is implemented by AppDatabaseInfo class.
3. **DBHelper**: Helper class, which help us to initialize/open database and create tables.
4. **DBInformer**: Interface class, which give us callback on database initialized/open.
5. **Tables**: Which contains all the table creation queries.

#### Data classes

- **Model** : Table class, contains all the table columns information.
- **Provider** : Data Provider class, which responsible to perform all CRUD operation on perticular Table.

#### Library reference resources

1. sqflite : https://pub.dev/packages/sqflite
2. shared_preferences : https://pub.dev/packages/shared_preferences 

-----------------------------------------------------------------------------

### For more understanding, Please refer this project also you can use this project if you want to quick start.

-----------------------------------------------------------------------------

## Benefits
- Easy Database implementation
- Time saving
- Clean Structure

## More?
If you have any suggestions or you can make this more better write me, create issue, or you can also write code and send pull request.

## Questions?
 
**Ping-Me on :**  [![Twitter](https://img.shields.io/badge/Twitter-%40UTM__Panchasara-blue.svg)](https://twitter.com/UTM_Panchasara)
[![Facebook](https://img.shields.io/badge/Facebook-Uttam%20Panchasara-blue.svg)](https://www.facebook.com/UttamPanchasara94)


<a href="https://stackoverflow.com/users/5719935/uttam-panchasara">
<img src="https://stackoverflow.com/users/flair/5719935.png" width="208" height="58" alt="profile for Uttam Panchasara at Stack Overflow, Q&amp;A for professional and enthusiast programmers" title="profile for Uttam Panchasara at Stack Overflow, Q&amp;A for professional and enthusiast programmers">
</a>


# Donate
> If you found this project helpful, consider buying me a cup of :coffee:
- Paypal **https://paypal.me/UttamPanchasara**
