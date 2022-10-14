import 'package:flutter/material.dart';
import 'package:kodo_app/widgets/item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "Jerin";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    List toDoList = [
      ["Make App", false],
      ["Buy Vegetables", false]
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 75), // here the desired height
        child: Container(
          height: 75.0,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Center(
            child: Text(
              "HEY $userName!".toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 5.0,
            left: 1.0,
            right: 1.0,
            top: 5.0,
          ),
          child: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return ItemTile(
                taskCompleted: toDoList[index][1],
                taskName: toDoList[index][0],
                onChanged: (p0) {},
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: _CustomBottomNavBar(width: width),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 75.0,
      child: Row(
        children: <Widget>[
          Container(
            width: width / 2,
            height: 75,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
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
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                print('width $width');
              },
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
    );
  }
}
