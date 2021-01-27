import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AppModel with ChangeNotifier{
  bool darkTheme = false;
  String locale = "vi";


  File _image;

  File get image => _image;

  set image(File value) {
    _image = value;
  }
  final picker = ImagePicker();
  _imgFromCamera(Function success) async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    );

    _image = File(pickedFile.path);
    success(_image);
    notifyListeners();
  }

  _imgFromGallery(Function success) async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    _image = File(pickedFile.path);
    success(_image);
    notifyListeners();
  }

  void showPicker({BuildContext context, Function success}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery(success);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera(success);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
