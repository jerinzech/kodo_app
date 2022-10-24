import 'package:flutter/material.dart';
import 'package:kodo_app/config/constants.dart';
import 'package:kodo_app/screens/folderpage.dart';
import 'package:kodo_app/screens/taskpage.dart';
import 'package:kodo_app/widgets/item_tile.dart';
import 'package:kodo_app/widgets/itemadd.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "Jerin";

  final _controllerText = TextEditingController();
  final _controllerF = TextEditingController();

  //demo list
  List toDoList = [
    [
      ['folder1', 'foldercolor', 'folderfont'],
      ["Make App", false]
    ],
    [
      ['folder1', 'foldercolor', 'folderfont'],
      ["Buy Vegetables", false]
    ]
  ];

  //checkbox toggle
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTile() {
    setState(() {
      toDoList.add([_controllerText.text, false]);
      Navigator.of(context).pop();
    });
  }

  void saveFolder() {
    setState(() {
      toDoList.add([
        [
          _controllerF.text,
        ]
      ]);
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return FolderPage();
  }
}
