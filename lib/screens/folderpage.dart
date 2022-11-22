import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kodo_app/config/database.dart';

import '../config/constants.dart';
import '../widgets/folderadd.dart';
import '../widgets/foldertile.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

// final tileColor = AppColors1;

final _controllerText = TextEditingController();

class _FolderPageState extends State<FolderPage> {
  // reference to hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    //
    super.initState();

    //loading data based on databse first load or not
    if (_myBox.get("TODOLIST") == null) {
      //database blank so loads default databse
      db.createInitialData();
    } else {
      //data already exists
      db.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    const userName = 'Jerin';
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    void createNewFolder() {
      showModalBottomSheet(
          enableDrag: false,
          isScrollControlled: true,
          // isDismissible: false,
          context: context,
          builder: (context) {
            return FolderAdd(
                // controllerF: _controllerText,
                // controller: _controllerText,
                // onSave: saveNewTile,
                // onCancel: () => Navigator.of(context).pop(),
                );
          });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 75), // here the desired height
        child: _CustomAppBar(userName: userName),
      ),
      body: Container(
        height: 800,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: 5.0, left: 1.0, right: 1.0, top: 5.0),
          child: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return FolderTile(
                folderName: db.toDoList[index][0][0],
                folderColor: Colors.blue,
                folderFont: robotoMonoStyle.copyWith(
                  fontSize: 30.0,
                ),
                folderIndex: 0,
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 75.0,
        child: Row(
          children: <Widget>[
            Container(
              width: width / 2,
              height: 75,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.5),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text(
                  'Settings'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: width / 2,
              height: 75,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.5),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: createNewFolder,

                // onPressed: createNewTile,
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: Center(
        child: Text(
          "HEY $userName!".toUpperCase(),
          style: montserratStyle.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
