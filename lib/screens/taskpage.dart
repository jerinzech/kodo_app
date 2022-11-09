import 'package:flutter/material.dart';
import 'package:kodo_app/config/constants.dart';
import 'package:kodo_app/screens/folderpage.dart';
import 'package:kodo_app/widgets/item_tile.dart';
import 'package:kodo_app/widgets/itemadd.dart';

class FilePage extends StatefulWidget {
  final int folderIndex;
  const FilePage({
    super.key,
    required this.folderIndex,
  });

  @override
  State<FilePage> createState() => _FilePageState();
}

List toDoList = [
  [
    ['folder 1', AppColors.cream, righteousStyle],
    [
      ["Make App1", false],
      ["change design1", false],
      ["Make App1", false],
      ["Make App1", false],
      ["Make App1", false],
    ]
  ],
  [
    ['folder 2', AppColors.sageGrey, robotoMonoStyle],
    [
      ["Make App2", false],
      ["change design2", false],
      ["Make App2", false],
      ["Make App2", false],
      ["Make App2", false],
    ]
  ],
  [
    ['folder 3', AppColors.liteGreen, kanitStyle],
    [
      ["Make App3", false],
      ["change design3", false],
      ["Make App3", false],
      ["Make App3", false],
      ["Make App3", false],
    ]
  ],
  [
    ['folder 4', AppColors.purple, yesevaOneStyle],
    [
      ["Make App4", false],
      ["change design4", false],
      ["Make App4", false],
      ["Make App4", false],
      ["Make App4", false],
    ]
  ],
  [
    ['folder 5', AppColors.liteBlue, dmSansStyle],
    [
      ["Make App5", false],
      ["change design5", false],
      ["Make App5", false],
      ["Make App5", false],
      ["Make App5", false],
    ]
  ],
  [
    ['folder 6', AppColors.litebrown, playfairDisplayStyle],
    [
      ["Make App6", false],
      ["change design6", false],
      ["Make App6", false],
      ["Make App6", false],
      ["Make App6", false],
    ]
  ],
  [
    ['folder 7', AppColors.liteOrange, righteousStyle],
    [
      ["Make App7", false],
      ["change design7", false],
      ["Make App7", false],
      ["Make App7", false],
      ["Make App7", false],
    ]
  ],
  [
    ['folder 8', AppColors.orange, sourceCodeProStyle],
    [
      ["Buy Vegetables8", false],
      ["Buy Vegetables8", false],
      ["Buy Vegetables8", false],
      ["Buy Vegetables8", false],
    ]
  ]
];
var tempTaskList = toDoList[1][1];
int taskCount = tempTaskList.length;

class _FilePageState extends State<FilePage> {
  var toDoList = [];

  var folderIndex;

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
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      tempTaskList[folderIndex][[index][1]] =
          !tempTaskList[folderIndex][[index][1]];
    });
  }

  void saveNewTile() {
    setState(() {
      toDoList.add([_controllerText.text, false]);
      Navigator.of(context).pop();
    });
  }

  final _controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, 75), // here the desired height
          child: _CustomAppBar(),
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
                  taskName: tempTaskList[index][0],
                  taskCompleted: tempTaskList[index][1],
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
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = toDoList[1][0][0];

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
