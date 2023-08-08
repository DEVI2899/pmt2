import 'package:employee_details/Dashboard/Admin.dart';
import 'package:employee_details/Screens/RegisterScreen.dart';
import 'package:employee_details/Screens/logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  TextEditingController UserNameController =TextEditingController();
  TextEditingController PasswordController =TextEditingController();

  //final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9_-]{3,20}$');
  
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: Height,
        width:Width,
        color: const Color(0xff6C98FD  ),
        
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Height/25),
                  child: Image(image: AssetImage('assets/images/Login.png')),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Height/70.5),
                  child:  Text('Welcome Back !', style: TextStyle(color: Color(0xff080808), fontWeight: FontWeight.bold, fontSize: Height/22),),
                ),
                Padding(
                  padding:EdgeInsets.only(top:Height/90.5),
                  child: Text("Login into your account",style: TextStyle(color:Color(0xff1643f7),fontSize: Width/25),),
                ),
                Padding(
                  padding:EdgeInsets.only(top: Height/55,right:Width/ 2.1),
                  child: Text('username', style: TextStyle(fontSize: Height/35),),
                ),
                SizedBox(
                  height: Height/13,width: Width/1.4,
                  child: Form(
                    key: _formkey,
                    child: TextFormField(
                      //validate the username using RegExp
                      validator: (value){
                        if(value!.isEmpty){
                          return ("Please Enter your username ");
                        }
                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]").hasMatch(value)){
                          return ("please Enter valid Email");
                        }
                      },
                         autofocus: false,
                         controller: UserNameController,
                         keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       filled: true,
                      //errorText: 'enter the user name',
                    fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Height/70),
                    ),
                    suffixIcon: const Icon(
                      Icons.person_outline,color: Color(0xff080808),
                         ),
                        ),
                     ),
                  ),
                ),
                SizedBox(height: Height/60,),
                Padding(
                  padding: EdgeInsets.only(right: Width/2),
                  child: Text('Password', style: TextStyle(fontSize: Height/35),),
                  ),
                SizedBox(
                  height: Height/12,width: Width/1.4,
                  child: Form(
                    key: _formkey2,
                    child: TextFormField(
                      //validating password using Regexp
                      validator: (value){
                       final  RegExp regex = RegExp (r'^,{6,}$');
                        if(value!.isEmpty){
                          return('Password required for login');
                        }
                        if(!regex.hasMatch(value)){
                          return('please Enter valid password');
                        }
                      },
                      autofocus: false,
                      obscureText: true,
                      controller: PasswordController,
                      keyboardType: TextInputType.text,
                      onSaved: (value){
                        PasswordController.text = value!;
                      },
                      decoration:  InputDecoration(
                        //errorText: 'Enter password',
                        filled: true,
                        fillColor: Color(0xffffffff),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Height/70),
                        ),
                        suffixIcon: Icon(
                          Icons.lock_outline,color: Color(0xff080808),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:Height/50),
                  child: Material(
                    elevation: 5,
                    color: Color(0xff1643f7),
                    borderRadius: BorderRadius.circular(Height/70,),
                    child: SizedBox(height: Height/20,width: Width/3,
                      child: MaterialButton(
                      onPressed: (){
                          Login(UserNameController.text, PasswordController.text);


                      }, child: Text('LOGIN' ,style: TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold),),),
                    ),
               ),
                ),

                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: Width/6),
                      child: Text("Don't you have an account?",style: TextStyle(fontSize: Height/40, color: Color(0xff080808)),),
                  ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  RegisterScreen()));
                      },
                      child: Text("Signup", style: TextStyle(fontSize: Height/40, color: Color(0xffffffff)),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      
    );
  }
  //login function
  Future<void> Login(String email , String password) async {
    if(_formkey.currentState!.validate()&& _formkey.currentState!.validate()) {
      await _auth.signInWithEmailAndPassword(email: email, password: password).
      then((uid) =>
      {
        Fluttertoast.showToast(msg: 'Login Successfully'),
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Admin()))
      }).catchError((e) {
        Fluttertoast.showToast(msg: e);
      });
    }
  }
}
