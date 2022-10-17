import 'package:flutter/material.dart';
import 'package:kodo_app/config/constants.dart';

class ItemTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ItemTile({
    super.key,
    required this.onChanged,
    required this.taskCompleted,
    required this.taskName,
  });

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
          // border: Border.symmetric(
          //     vertical: BorderSide.none,
          //     horizontal: BorderSide(color: Colors.white, width: 1))
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
                width: 75,
                child: Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: Colors.black),
              ),
              Text(
                taskName,
                style: montserratStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
