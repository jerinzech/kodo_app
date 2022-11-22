import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
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
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
