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

final _controllerText = TextEditingController();

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
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return FolderTile(
                folderName: toDoList[index][0][0],
                folderColor: toDoList[index][0][1],
                folderFont: toDoList[index][0][2],
                folderIndex: index,
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
