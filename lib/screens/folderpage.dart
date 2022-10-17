import 'package:flutter/material.dart';

import '../config/constants.dart';
import '../widgets/folderadd.dart';
import '../widgets/foldertile.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

List toDoList = [
  ["Make App", false],
  ["Buy Vegetables", false]
];

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    final userName = 'Jerin';
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
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return FolderTile(
                  // taskName: toDoList[index][0],
                  // taskCompleted: toDoList[index][1],
                  // onChanged: (value) => checkBoxChanged(value, index),
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
