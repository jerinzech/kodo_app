import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kodo_app/config/constants.dart';
import 'package:kodo_app/screens/folderpage.dart';
import 'package:kodo_app/widgets/item_tile.dart';
import 'package:kodo_app/widgets/itemadd.dart';

import '../config/database.dart';

class FilePage extends StatefulWidget {
  int folderIndex;

  FilePage({
    super.key,
    required this.folderIndex,
  });
  // final taskList = db.toDoList[folderIndex][1];
  @override
  State<FilePage> createState() => _FilePageState();
}

final _myBox = Hive.box('mybox');
ToDoDataBase db = ToDoDataBase();

class _FilePageState extends State<FilePage> {
// int taskCount = db.toDoList.length;

  get folderIndex => folderIndex;

  //create new tile
  void createNewTile() {
    showModalBottomSheet(
        enableDrag: false,
        isScrollControlled: true,
        // isDismissible: false,
        context: context,
        builder: (context) {
          return AddTile(
            controller: _controllerText,
            onSave: saveNewTile,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //checkbox toggle
  void checkBoxChanged(bool? value, int index, folderIndex) {
    setState(() {
      db.toDoList[folderIndex][[index][1]] =
          !db.toDoList[folderIndex][[index][1]];
    });
  }

  void saveNewTile() {
    setState(() {
      db.toDoList.add([_controllerText.text, false]);
      Navigator.of(context).pop();
    });
  }

  final _controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskList = db.toDoList[folderIndex][1];
    int taskCount = taskList.length;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, 75), // here the desired height
          child: _CustomAppBar(folderIndex: folderIndex),
        ),
        body: Container(
          height: 800,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 5.0, left: 1.0, right: 1.0, top: 5.0),
            child: ListView.builder(
              itemCount: taskCount,
              itemBuilder: (context, index) {
                return ItemTile(
                  taskName: db.toDoList[folderIndex][[index][0]],
                  taskCompleted: db.toDoList[folderIndex][[index][1]],
                  onChanged: (value) =>
                      checkBoxChanged(value, index, folderIndex),
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
                    'Back'.toUpperCase(),
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
                  onPressed: createNewTile,
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
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final int folderIndex;
  const _CustomAppBar({
    Key? key,
    required this.folderIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String title = 'heelo';
    final String title = db.toDoList[folderIndex][0][0];

    return Container(
      height: 75.0,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: Center(
        child: Text(
          "$title!".toUpperCase(),
          style: montserratStyle.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
