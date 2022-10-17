import 'package:flutter/material.dart';
import 'package:kodo_app/config/constants.dart';
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

  //demo list
  List toDoList = [
    ["Make App", false],
    ["Buy Vegetables", false]
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              return ItemTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
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
