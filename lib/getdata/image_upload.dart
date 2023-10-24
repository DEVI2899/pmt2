
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class image_upload extends StatefulWidget {
  const image_upload({Key? key}) : super(key: key);

  @override
  State<image_upload> createState() => _image_uploadState();
}

class _image_uploadState extends State<image_upload> {
  // XFile? image;
  // final imagepicker = ImagePicker();
  //  Future<void> ImagePickerMethod()async{
  //    // picking image
  //    final pick = await imagepicker.pickImage(source: ImageSource.gallery);
  //    if(pick!= null){
  //      image = File(p, pick.path);
  //    } else{
  //      ScaffoldMessenger.of(context).showSnackBar(
  //          SnackBar(content: Text('No images selected'),));
  //    }
  //      setState(() {
  //
  //      });
  //    }

  String ? Empid;
  Uint8List? _image;
  pickImage(ImageSource Source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source:Source );
    if(file!= null){
      return file.readAsBytes();
    }
    print('No Images Selected');
  }
  Future<void> selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  // void SaveProfile() async{
  //    String response = await storeData().SaveData(file:_image! );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image upload'),
      ),
      body: Column(
        children: [
          _image != null ?  GestureDetector(
              onTap: (){
                selectImage();
                // SaveProfile();
                print('image tapped');
              },
              child: CircleAvatar(backgroundImage: MemoryImage(_image!),))
              : GestureDetector(
                onTap: (){
                   print('profile tapped');
                   selectImage();
                },
                child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png')),
              ),
          const SizedBox(height:  50,)
        ],
      ),
    );
  }
}

