import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/Models/usermodel.dart';
import 'package:employee_details/Screens/Homepage.dart';
import 'package:employee_details/Screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController UserNamecontroller = TextEditingController();
  TextEditingController Emailcontroller= TextEditingController();
  TextEditingController Passwordcontroller= TextEditingController();
  TextEditingController ConfirmPasswordcontroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        height: Height,
        width: Width,
        color:const Color(0xff6C98FD),
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: Height/25),
                child: Image(image: const AssetImage('assets/images/Register.png',),height: Height/3.5,width: Width/1.1,),
              ),
              Text('Register',style: TextStyle(
                fontSize: Height/22,fontWeight: FontWeight.w500,color: const Color(0xff080808)),),
              Text('Create your Account',style: TextStyle(
                  fontSize: Height/40,fontWeight: FontWeight.normal,color: const Color(0xff1643f7)),),
              SizedBox(height: Height/60,),
              Padding(
                padding: EdgeInsets.only(right: Width/1.6),
                child: const Text('username', style: TextStyle(fontWeight:FontWeight.normal, color: Color(0xff080808)),),
              ),
              SizedBox(
                height: Height/15,width: Width/1.25,
                child: TextFormField(
                  controller: UserNamecontroller,

                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.person_outline,color: Color(0xff080808),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Height/70,),
              Padding(
                padding: EdgeInsets.only(right: Width/1.5),
                child: const Text('email-id', style: TextStyle(fontWeight: FontWeight.normal,color: Color(0xff080808)),),
              ),
              SizedBox(
                height: Height/15,width: Width/1.25,
                child: TextFormField(
                  controller: Emailcontroller,

                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.lock_outline,color: Color(0xff080808),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Height/70,),
              Padding(
                padding:  EdgeInsets.only(right: Width/1.6,),
                child: const Text('password', style: TextStyle(fontWeight: FontWeight.normal,color: Color(0xff080808))),
              ),
              SizedBox(
                height: Height/15,width: Width/1.25,
                child: TextFormField(
                  controller: Passwordcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.lock_outline,color: Color(0xff080808),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Height/70,),
              Padding(
                padding: EdgeInsets.only(right: Width/2.1),
                child: const Text('Confirm Password', style: TextStyle(fontWeight: FontWeight.normal,color: Color(0xff080808))),
              ),
              SizedBox(
                height: Height/15,width: Width/1.25,
                child: TextFormField(
                  controller: ConfirmPasswordcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.lock_outline,color: Color(0xff080808),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Height/60,),
              SizedBox(
                height: Height/15,width: Width/3,
                child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff1643f7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Height/60),

                        )
                   ),
                    onPressed: (){
                     // Register();
                      signup();
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    }, child: const Text('SIGNUP')),
              ),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: Width/6),
                    child: Text("Already have an account?",style: TextStyle(fontSize: Height/42, color: const Color(0xff080808)),),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  const Homepage()));
                    },
                    child: Text("Login", style: TextStyle(fontSize: Height/42, color: const Color(0xffffffff)),),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }


  void Register(){
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Emailcontroller.text, password: Passwordcontroller.text).then((value) {
         Fluttertoast.showToast(msg:'Register Successfully');
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
        }).onError((error ,stacktrace){
      print("Error ${error.toString()}");

    });
  }

  Future<void> signup() async {
    await _auth.createUserWithEmailAndPassword(
        email: Emailcontroller.text, password: Passwordcontroller.text)
        .then((value) {
          postfromdetailsfirestrore();
    });
    }

   postfromdetailsfirestrore() async{
     // calling our firestore
     // calling our user model
     // sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
     //writing all the values
    UserModel userModel = UserModel(username: '', password: '', uid: '', email: '');
    userModel.email =user!.email;
    userModel.uid =user.uid;
    userModel.username =UserNamecontroller.text;
    userModel.password =Passwordcontroller.text;

    
    await firebaseFirestore.collection("Register_user")
         .doc(user.uid)
         .set(userModel.toMap());
      Fluttertoast.showToast(msg: "Account created successfully");
       Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginScreen()));
   }
  }

