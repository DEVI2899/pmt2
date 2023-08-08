import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/Dashboard/Dashboard_project1.dart';
import 'package:employee_details/Models/usermodel.dart';
import 'package:employee_details/Screens/LoginScreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel LoggedinUser = UserModel();


  Future<void> Getdetails()async {
   await FirebaseFirestore.instance
        .collection("Register_user")
        .doc(user!.uid)
        .get()
        .then((value) =>
    this.LoggedinUser = UserModel.fromMap(value.data()));

  }

  @override
  void initState(){
     super.initState();
     // FirebaseFirestore.instance
     //      .collection("Register_user")
     //     .doc(user!.uid)
     //     .get()
     //     .then((value) =>
     //       this.LoggedinUser = UserModel.fromMap(value.data()));
     setState(() {
       Getdetails();
     });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("${LoggedinUser.username}"
                  ,style: const TextStyle(color: Colors.red),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("${LoggedinUser.email}"),
            ),
            ElevatedButton(onPressed: () {
               logout();
            }, child: const Text('Logout'),

            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  Project1()));
            }, child: const Text('Next screen '),

            ),
            ElevatedButton(onPressed: ()async{
              FilePickerResult?

              results = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                type: FileType.custom,
                allowedExtensions: ['jpg', 'png']
              );
              if(results == null){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('No file Selected')));
                return null;
              }
              final path = results.files.single.path!;
              final filename = results.files.single.name;
              print(path);
              print(filename);
            },
                child: const Text('Image upload Firebase Storage')),
            ElevatedButton(onPressed: (){}, child: Text(''))
          ],
        ),
      ),
    );
  }


  Future<void> logout()async{
    await FirebaseAuth.instance.signOut();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>  LoginScreen()));

  }
}
