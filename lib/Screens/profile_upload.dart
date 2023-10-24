
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class profile_upload extends StatefulWidget {
  const profile_upload({Key? key}) : super(key: key);

  @override
  State<profile_upload> createState() => _profile_uploadState();
}

class _profile_uploadState extends State<profile_upload> {
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: (imageUrl != null)
                  ? Image.network(imageUrl!)
                  : Image.network('https://i.imgur.com/sUFH1Aq.png')
          ),
          const SizedBox(height: 20.0,),
          ElevatedButton(
            onPressed: (){},
            style:ElevatedButton.styleFrom(
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.blue)
              ),
              backgroundColor: Colors.blue
            ) ,
            child: const Text("Upload Image", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),

          ),
        ],

      ),
    ),
    );
  }

  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;
    //Check Permissions
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted){
      //Select Image
      image = (await _imagePicker.pickImage(source: ImageSource.gallery)) as PickedFile;
      var file = File(image.path);
      if (image != null){
        //Upload to Firebase
        var snapshot = await _firebaseStorage.ref()
            .child('images/imageName')
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }

}
