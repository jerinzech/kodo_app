import 'package:flutter/material.dart';
import 'package:kodo_app/config/constants.dart';

class FolderAdd extends StatelessWidget {
  // final controller;

  // VoidCallback? onSave;
  // VoidCallback? onCancel;

  // AddTile({
  //   super.key,
  //   required this.controller,
  //   required this.onSave,
  //   required this.onCancel,
  // });

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
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                    ),
                    child: TextField(
                        // controller: controller,
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
                Spacer(),
                Spacer(),
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
                          onPressed: () {},
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