import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        color: Colors.amber,
        height: 100,
        width: width,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.white, width: 1),
        // ),
      ),
    );
  }
}
