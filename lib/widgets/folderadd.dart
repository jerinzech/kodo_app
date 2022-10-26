import 'package:flutter/material.dart';
import 'package:kodo_app/config/constants.dart';
import 'package:kodo_app/config/database.dart';
import 'package:kodo_app/screens/folderpage.dart';

class FolderAdd extends StatefulWidget {
  // final controllerF;
  FolderAdd({
    super.key,
    // required this.controllerF,
  });

  @override
  State<FolderAdd> createState() => _FolderAddState();
}

List todolist = [];

class _FolderAddState extends State<FolderAdd> {
  List folderColorList = [
    AppColors.liteGreen,
    AppColors.litebrown,
    AppColors.cream,
    AppColors.liteOrange,
    AppColors.orange,
    AppColors.liteBlue,
    AppColors.purple,
    AppColors.sageBlue,
    AppColors.sageGrey
  ];

  // List folderFontList = [
  //   righteousStyle.copyWith(
  //       fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),
  //   robotoMonoStyle.copyWith(
  //       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  //   concertOneStyle.copyWith(
  //       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  //   kanitStyle.copyWith(
  //       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  //   yesevaOneStyle.copyWith(
  //       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  //   dmSansStyle.copyWith(
  //       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  //   playfairDisplayStyle.copyWith(
  //       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)
  // ];

  List folderFontList = [
    righteousStyle,
    robotoMonoStyle,
    kanitStyle,
    yesevaOneStyle,
    dmSansStyle,
    playfairDisplayStyle,
    sourceCodeProStyle
  ];

  var selectedC;
  var selectedF;
  var selectedFont;
  var selectedColor;

  get controllerF => null;

  // Function selectFont() {
  @override
  Widget build(BuildContext context) {
    final mediaPadding = MediaQuery.of(context);

    return Padding(
      padding: mediaPadding.viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 0.0,
            left: 1.0,
            right: 1.0,
            top: 1.0,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: SizedBox(
            height: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                    ),
                    child: TextField(
                        // controller: controllerF,
                        textAlignVertical: TextAlignVertical.top,
                        cursorColor: Colors.white,
                        style: montserratStyle.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0.5,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0.5,
                            ),
                          ),
                          labelText: 'folder name',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: montserratStyle.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    height: 80,
                    child: Container(
                        color: Colors.grey[900],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 2),
                              height: 20,
                              child: Text(
                                "folder color",
                                textAlign: TextAlign.left,
                                style: montserratStyle.copyWith(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 8,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 8,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 25,
                                      width: 25,
                                      padding: const EdgeInsets.all(5.0),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          side: MaterialStateBorderSide
                                              .resolveWith(
                                                  (Set<MaterialState> states) {
                                            if (selectedC == index) {
                                              return const BorderSide(
                                                  color: Colors.white);
                                            }
                                            return null; // Defer to default value on the theme or widget.
                                          }),
                                        ),
                                        autofocus: true,
                                        onPressed: () {
                                          setState(() {
                                            selectedC = index;
                                            selectedColor =
                                                folderColorList[index];
                                          });
                                          print(selectedColor);
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          color: folderColorList[index],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    height: 120,
                    child: Container(
                      color: Colors.grey[900],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10, top: 2),
                            height: 20,
                            child: Text(
                              "folder font",
                              textAlign: TextAlign.left,
                              style: montserratStyle.copyWith(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 6,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 50.0,
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    // color: Colors.white,
                                    padding: const EdgeInsets.all(5.0),
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          // If the button is pressed, return green, otherwise blue
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return Colors.white;
                                          }
                                          return Colors.white;
                                        }),
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                                (Set<MaterialState> states) {
                                          if (selectedF == index) {
                                            return const BorderSide(
                                                strokeAlign:
                                                    StrokeAlign.outside,
                                                width: 2,
                                                color: Colors.red);
                                          }
                                          return null; // Defer to default value on the theme or widget.
                                        }),
                                      ),
                                      autofocus: true,
                                      onPressed: () {
                                        setState(() {
                                          selectedF = index;
                                          selectedFont = folderFontList[index];
                                        });
                                        print(folderFontList[index]);
                                        print(selectedFont);
                                      },
                                      child: Text(
                                        'Hello',
                                        style: folderFontList[index],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          // onPressed: onCancel,
                          child: Text(
                            'Cancel'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          // saveFolder(
                          //     controllerF.text, selectedColor, selectedFont),
                          // onPressed: onSave,
                          child: Text(
                            'Save'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveFolder(text, selectedColor, selectedFont) {}
}





















// showModalBottomSheet(
//                       backgroundColor: Colors.black,
//                       context: context,
//                       builder: (BuildContext context) {
//                         return Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Container(
//                             padding: const EdgeInsets.only(
//                               bottom: 0.0,
//                               left: 1.0,
//                               right: 1.0,
//                               top: 1.0,
//                             ),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.white, width: 2),
//                             ),
//                             child: SizedBox(
//                               height: 500,
//                               child: Column(
//                                 children: [
//                                   Spacer(),
//                                   TextField(),
//                                   Row(
//                                     children: <Widget>[
//                                       Expanded(
//                                         child: Container(
//                                           height: 75,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: Colors.white, width: 2),
//                                           ),
//                                           child: TextButton(
//                                             style: TextButton.styleFrom(
//                                               foregroundColor: Colors.white,
//                                             ),
//                                             onPressed: () {},
//                                             child: Text(
//                                               'Cancel'.toUpperCase(),
//                                               style: const TextStyle(
//                                                 fontSize: 20,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Container(
//                                           height: 75,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: Colors.white, width: 2),
//                                           ),
//                                           child: TextButton(
//                                             style: TextButton.styleFrom(
//                                               foregroundColor: Colors.white,
//                                             ),
//                                             onPressed: () {},
//                                             child: Text(
//                                               'Save'.toUpperCase(),
//                                               style: const TextStyle(
//                                                 fontSize: 20,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       });