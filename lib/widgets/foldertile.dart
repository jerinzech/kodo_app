import 'package:flutter/material.dart';
import 'package:kodo_app/screens/taskpage.dart';

class FolderTile extends StatelessWidget {
  final String folderName;
  final Color folderColor;
  final TextStyle folderFont;
  final int folderIndex;

  const FolderTile({
    super.key,
    required this.folderName,
    required this.folderColor,
    required this.folderFont,
    required this.folderIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FilePage(
                      folderIndex: folderIndex,
                    )),
          );
          print(folderName);
        },
        child: Container(
          color: folderColor,
          height: 70,
          // padding: EdgeInsets.only(top: 2, bottom: 2),
          child: Row(children: [
            SizedBox(
              width: 30,
            ),
            Center(
              child: Text(
                folderName.toUpperCase(),
                style: folderFont,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios_rounded),
            SizedBox(
              width: 30,
            ),
          ]),
        ),
      ),
    );
  }
}
