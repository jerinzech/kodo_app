import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ItemTile(
      {super.key,
      required this.onChanged,
      required this.taskCompleted,
      required this.taskName});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 1.0,
        left: 1.0,
        right: 1.0,
        top: 1.0,
      ),
      child: Container(
        height: 75,
        width: width,
        decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.symmetric(
                vertical: BorderSide.none,
                horizontal: BorderSide(color: Colors.white, width: 2))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged),
              Text(taskName),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
