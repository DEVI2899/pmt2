import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/Models/usermodel.dart';
import 'package:employee_details/Dashboard/Newtrainees.dart';
import 'package:employee_details/Screens/logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/LoginScreen.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController searchcontroller =TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel LoggedinUser = UserModel();
  List _allResults = [];


  void Getdetails()async {
    await FirebaseFirestore.instance.collection("Register_user").doc(user!.uid).get()
        .then((value) =>
    LoggedinUser = UserModel.fromMap(value.data()));

  }

  Searchingfun()async {
    var Searchdata =await FirebaseFirestore.instance.collection('newtrainees').doc(
        'project').collection('project1').get();
    setState(() {
      _allResults = Searchdata.docs;
    });
  }
  @override
  void initState(){
     Searchingfun();
     searchcontroller.addListener((_onSearchChanged));
    super.initState();
    setState(() {
      Getdetails();
    });
  }
  _onSearchChanged(){
     print(searchcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff6C98FD),
      // appBar: AppBar(
      //   toolbarHeight: Height/7,
      //   backgroundColor: Color(0xffffffff),
      //   leading : Column(
      //     children: [
      //       Row(children:[
      //         Text("Hello",style: TextStyle(color: Color(0xff080808), fontSize: Width/27)),
      //         Text("${LoggedinUser.username}",style: TextStyle(color: Color(0xff080808))),
      //         ]
      //       ),
      //       Row(children: [
      //         Text("${LoggedinUser.Empid}",style: TextStyle(color: Color(0xff080808))),
      //       ],),
      //       Row(children: [
      //         Text("Admin",style: TextStyle(color: Color(0xff080808))),
      //       ],),
      //     ],
      //   ),
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.only(right: Width/25),
      //       child: Image(height:Height/50,
      //           width: Width/5,
      //           image: AssetImage("assets/images/sampleprofile.png",)
      //       ),
      //     )
      //   ],
      // ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xffffffff),
              height: Height/5,
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Width/25, top: Height/25),
                        child: Row(children:[
                          Text("Hello, ",style: TextStyle(color: const Color(0xff080808), fontSize: Height/32, fontWeight: FontWeight.bold)),
                          Text("${LoggedinUser.username}",style:  TextStyle(color: const Color(0xff273cf5), fontWeight: FontWeight.normal,fontSize: Height/28,)),
                        ]
                        ),
                      ),
                      SizedBox(height: Height/60,),
                      Row(children: [
                        Text("${LoggedinUser.Empid}",style:  TextStyle(color: const Color(0xff273cf5), fontWeight: FontWeight.normal,fontSize: Height/32,)),
                      ],),
                      SizedBox(height: Height/60,),
                      Row(children: [
                        Text("${LoggedinUser.Role}",style: TextStyle(color: const Color(0xff999999),fontWeight: FontWeight.normal,fontSize: Height/32,)),
                      ],),
                    ],
                  ),
                      Padding(
                        padding: EdgeInsets.only(left: Width/2.2),
                        child: Image(height:Height/10,
                            width: Width/5,
                            image: const AssetImage("assets/images/profile.png",)
                        ),
                      )

                ],
              ),),
            Padding(
              padding: EdgeInsets.only(left: Width/20, top:Height/50 ),
              child: Container(
                height: Height/15,
                width: Width/1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffffff)
                  ),
                child: TextFormField(
                  controller: searchcontroller,
                  decoration:InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Color(0xff080808),),
                    suffixIcon: const Icon(Icons.refresh_outlined ,color: Color(0xff6C98FD),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ) ,
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Height/25,left: Width/20),
              child: Container(
                height: Height/6.5,
                width: Width/1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),

                child: InkWell(
                  onTap:() {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Newtrainee()));},
                  child:Card(
                  elevation: Height/50,
                  color: const Color(0xffffffff),
                  child: Row(children: [
                    Container(
                      height: Height,width: Width/20,
                      color: const Color(0xff050695),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:EdgeInsets.only(left: Width/5),
                          child: Text("NEW TRAINEES", style: TextStyle(color: const Color(0xff050695), fontWeight: FontWeight.normal,fontSize:Width/18 ),),
                        ),
                        Padding(
                          padding:EdgeInsets.only(left: Width/5,top: Height/50 ),
                          child: Text('200', style: TextStyle(color: const Color(0xff080808),fontWeight: FontWeight.normal,fontSize:Width/20),),
                        )
                      ],
                    )
                  ],),
                ),
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Height/25,left: Width/20),
              child: Container(
                height: Height/6.5,
                width: Width/1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Card(
                  elevation: Height/50,
                  color: const Color(0xffffffff),
                  child: Row(children: [
                    Container(
                      height: Height,width: Width/20,
                      color: const Color(0xffC640C9),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:EdgeInsets.only(left: Width/6),
                          child: Text("EXISTING TRAINEES", style: TextStyle(color: const Color(0xffC640C9), fontWeight: FontWeight.normal,fontSize:Width/18 ),),
                        ),
                        Padding(
                          padding:EdgeInsets.only(left: Width/6,top: Height/50 ),
                          child: Text('150', style: TextStyle(color: const Color(0xff080808),fontWeight: FontWeight.normal,fontSize:Width/20),),
                        )
                      ],
                    )
                  ],),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Height/25,left: Width/20),
              child: Container(
                height: Height/6.5,
                width: Width/1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: InkWell(
                  onTap:() {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Newtrainee()));},
                  child: Card(
                    elevation: Height/50,
                    color: const Color(0xffffffff),
                      child: Row(children: [
                        Container(
                          height: Height,width: Width/20,
                          color: const Color(0xff42A97A),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:EdgeInsets.only(left: Width/6),
                              child: Text("OVERALL TRAINEES", style: TextStyle(color: const Color(0xff42A97A), fontWeight: FontWeight.normal,fontSize:Width/18 ),),
                            ),
                            Padding(
                              padding:EdgeInsets.only(left: Width/6,top: Height/50 ),
                              child: Text('350', style: TextStyle(color: const Color(0xff080808),fontWeight: FontWeight.normal,fontSize:Width/20),),
                            )
                          ],
                        )
                      ],),
                  ),
                ),
              ),
            ),
          ],
        ),
      ) ,
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
}
Future<void> LogoutIcon(BuildContext context) async {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 7), () {
          Navigator.of(context).pop(true);
        });
        return  AlertDialog(
          backgroundColor: const Color(0xff6C98FD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: EdgeInsets.only( left: width/20, bottom:height/20, right: width/30,  top: height/90),
          title: const Image(image: AssetImage('assets/images/profile.png')),
          content: const Text('Are you Sure want to logout',
            style: TextStyle(color:Color(0xffffffff), fontSize: 25 ),),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SizedBox(
                height: height/20,
                width: width/3.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffffffff),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(height/70)), //////// HERE
                  ),
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel' , style: TextStyle(color: Color(0xff273cf5)),),
                ),
              ),
              SizedBox(
                height: height/20,
                width: width/3.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff1643f7),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(height/70)), //////// HERE
                  ),
                  onPressed: () => MaterialPageRoute(builder: (context)=>const LoginScreen()),
                  child: const Text('Logout' ,style: TextStyle(color: Color(0xffffffff)),
                  ),
                ),
              ),
                SizedBox(height: height/10,)
            ],),

          ],


        );
      });
}
Widget buildMyNavBar(BuildContext context) {
  double Height = MediaQuery.of(context).size.height;
  double Width = MediaQuery.of(context).size.width;
  return  Container(
    height: Height/15,
    width: Width/4,
    color: const Color(0xff080808),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed:(){
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => const Admin()));
        }, icon:ImageIcon(const AssetImage('assets/images/Listicon.png'),size:Height/30,color: const Color(0xffffffff),)),
        IconButton(onPressed:(){}, icon:ImageIcon(const AssetImage('assets/images/homeicon.png') ,size:Height/30,color: const Color(0xffffffff),)),
        IconButton(onPressed: (){
          LogoutIcon(context);
          // Navigator.pushReplacement(context, MaterialPageRoute(
          //     builder: (context) => const Logout()));
        }, icon: Icon(Icons.logout, size: Height/25,color: const Color(0xffffffff),)),

      ],
    ),

  );

}