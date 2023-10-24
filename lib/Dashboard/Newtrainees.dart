import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/Dashboard/Admin.dart';
import 'package:employee_details/Dashboard/Dashboard_project1.dart';
import 'package:flutter/material.dart';

class Newtrainee extends StatefulWidget {
  const Newtrainee({Key? key}) : super(key: key);

  @override
  State<Newtrainee> createState() => _NewtraineeState();
}

class _NewtraineeState extends State<Newtrainee> {

  // Project1 projectcount =Project1();
  // void countMethod() {
  //   // Accessing the data count
  //   int count = projectcount.Getcount() as int;
  //   print('Data count: $count');
  // }

  // @override
  // void initState(){
  //   super.initState();
  //   countMethod();
  // }

  // CollectionReference ref = FirebaseFirestore.instance
  //     .collection('newtrainees')
  //     .doc('project')
  //     .collection('project1');
  //var employeecount = ref.count();

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff6C98FD),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon:const Icon(Icons.arrow_back),color: const Color(0xff080808), onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const Admin()));
        },) ,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: EdgeInsets.only(right: Width/8),
              child: const Text(
                'NEW TRAINEES',
                style: TextStyle(color: Color(0xff050695)),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xffffffff), //<-- SEE HERE
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
              Padding(
                padding: EdgeInsets.only(left: Width/20, top: Height/30),
                child: SizedBox(
                  height: Height/4.5,
                  width: Width/2.4,
                  child: InkWell(onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>const Project1()));
                  },
                  child: Card(
                    elevation: Height/50,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: Height/50),
                          child: const Image(
                            image: AssetImage('assets/images/G1.png'),),
                        ),
                        Text('Project-1', style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal),),
                        Text('50',style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal))
                      ],
                    ),

                  ),
                    ),
                ),
              ),
                Padding(
                  padding: EdgeInsets.only(left: Width/12, top: Height/30),
                  child: SizedBox(
                    height: Height/4.5,
                    width: Width/2.4,
                    child: InkWell(onTap: (){},
                      child: Card(
                        elevation: Height/50,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:  Height/50),
                              child: const Image(
                                image: AssetImage('assets/images/G2.png'),),
                            ),
                            Text('Project-2', style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal),),
                            Text('50',style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ],),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Width/20, top: Height/30),
                  child: SizedBox(
                    height: Height/4.5,
                    width: Width/2.4,
                    child: InkWell(onTap: (){},
                      child: Card(
                        elevation: Height/50,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: Height/50),
                              child: const Image(
                                image: AssetImage('assets/images/G3.png'),),
                            ),
                            Text('Project-3', style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal),),
                            Text('50',style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Width/12, top: Height/30),
                  child: SizedBox(
                    height: Height/4.5,
                    width: Width/2.4,
                    child: InkWell(onTap: (){},
                      child: Card(
                        elevation: Height/50,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: Height/50),
                              child: const Image(
                                image: AssetImage('assets/images/G4.png'),),
                            ),
                            Text('Project-4', style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal),),
                            Text('50',style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Width/20, top: Height/30),
                  child: SizedBox(
                    height: Height/4.5,
                    width: Width/2.4,
                    child: InkWell(onTap: (){},
                      child: Card(
                        elevation: Height/50,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: Height/50),
                              child: const Image(
                                image: AssetImage('assets/images/G5.png'),),
                            ),
                            Text('Project-5', style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal),),
                            Text('50',style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Width/12, top: Height/30),
                  child: SizedBox(
                    height: Height/4.5,
                    width: Width/2.4,
                    child: InkWell(onTap: (){},
                      child: Card(
                        elevation: Height/50,
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.only(top: Height/50),
                              child: const Image(
                                image: AssetImage('assets/images/G6.png'),),
                            ),
                            Text('Project-6', style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal),),
                            Text('50',style: TextStyle(fontSize: Height/40, color: const Color(0xff080808), fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],)
          ],
        ),
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
}


