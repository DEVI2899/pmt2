import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/Dashboard/Dashboard_project1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class update_details extends StatefulWidget {
  const update_details({Key? key, this.data,  required this.ref}) : super(key: key);
  final data;
  final  ref;

  @override
  State<update_details> createState() => _update_detailsState();
}

class _update_detailsState extends State<update_details> {


  GlobalKey<FormState> key = GlobalKey<FormState>();



  TextEditingController? NameController;
  TextEditingController? EmpidController;
  TextEditingController? Designationcontroller;
  TextEditingController? ProjectController;


  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.
  collection('newtrainees').doc('project').collection('project1').snapshots();



  @override
  void initstate() {
    super.initState();
    NameController = TextEditingController(text: widget.data.toString());
    EmpidController = TextEditingController();
    Designationcontroller = TextEditingController();
    ProjectController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // Name = widget.data['Name'];
    // Empid = widget.data['Empid'];
    // Designation = widget.data['Designation'];
    // project = widget.data['project'];
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff6C98FD),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back),
          color: const Color(0xff080808),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (BuildContext context) => const Project1()));
          },),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: Width / 10),
            Image.asset('assets/images/projecticon.png',
              // scale: 1.3,
            ),
            SizedBox(width: Width / 25),
            const Text(
              'Project-1',
              style: TextStyle(color: Color(0xff1643f7)),
            ),
          ],
        ),
        backgroundColor: const Color(0xffffffff), //<-- SEE HERE
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(Height / 40),
              child: Container(height: Height / 1.8,
                width: Width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Height / 70),
                  color: const Color(0xffffffff),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Width / 10,),
                          child: Text('Photo', style: TextStyle(
                              color: const Color(0xff080808),
                              fontWeight: FontWeight.normal,
                              fontSize: Width / 20),),
                        ),
                        SizedBox(width: Width / 3.5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: Height / 10,
                            width: Width / 5,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/sampleprofile.png'))
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: Width / 10,
                              top: Height / 25),
                          child: Text('Name', style: TextStyle(
                              color: const Color(0xff080808),
                              fontWeight: FontWeight.normal,
                              fontSize: Width / 20),),
                        ),

                        SizedBox(width: Width / 5),
                        Padding(
                          padding: EdgeInsets.only(top: Height / 30),
                          child: SizedBox(
                            height: Height / 20, width: Width / 2.3,
                            child: TextFormField(
                              initialValue: widget.data['Name'],
                              controller: NameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Height / 100),

                                ),
                              ),

                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: Width / 10,
                              top: Height / 20),
                          child: Text('Emp-id', style: TextStyle(
                              color: const Color(0xff080808),
                              fontWeight: FontWeight.normal,
                              fontSize: Width / 20),),
                        ),
                        SizedBox(width: Width / 5.5),
                        Padding(
                          padding: EdgeInsets.only(top: Height / 30),
                          child: SizedBox(
                            height: Height / 20, width: Width / 2.3,
                            child: TextFormField(
                              initialValue: widget.data['Empid'].toString(),
                              controller: EmpidController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Height / 100),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: Width / 10,
                              top: Height / 20),
                          child: Text('Designation', style: TextStyle(
                              color: const Color(0xff080808),
                              fontWeight: FontWeight.normal,
                              fontSize: Width / 20),),
                        ),
                        SizedBox(width: Width / 14),
                        Padding(
                          padding: EdgeInsets.only(top: Height / 30),
                          child: SizedBox(
                            height: Height / 20, width: Width / 2.3,
                            child: TextFormField(
                              initialValue: widget.data['Designation']
                                  .toString(),
                              controller: Designationcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Height / 100),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: Width / 10,
                              top: Height / 20),
                          child: Text('Project', style: TextStyle(
                              color: const Color(0xff080808),
                              fontWeight: FontWeight.normal,
                              fontSize: Width / 20),),
                        ),
                        SizedBox(width: Width / 5.5),
                        Padding(
                          padding: EdgeInsets.only(top: Height / 30),
                          child: SizedBox(
                            height: Height / 20, width: Width / 2.3,
                            child: TextFormField(
                              initialValue: widget.data['project'].toString(),
                              controller: ProjectController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Height / 100),

                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Height / 30, left: Width / 16),
                  child: SizedBox(
                    height: Height / 15, width: Width / 2.6,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xfffcfcfc)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Height / 80)
                          )
                      ),
                      child: Text("Delete", style: TextStyle(color: const Color(
                          0xff1643f7), fontSize: Height / 35),
                      ),
                      onPressed: () {
                        DeleteUser();
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: Height / 32, left: Width / 8),
                    child: SizedBox(
                      height: Height / 15, width: Width / 2.6,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff1643f7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Height / 80)
                            )
                        ),
                        onPressed: ([DocumentSnapshot? documentSnapshot]) async {

                          if(documentSnapshot != null){

                            NameController!.text = documentSnapshot['Name'];
                            EmpidController!.text= documentSnapshot['Empid'].toString();
                            Designationcontroller!.text= documentSnapshot['Designation'];
                            ProjectController !.text= documentSnapshot['project'];
                          }
                          //updateUser();
                          // updateFirestoreData;
                          update();
                          String? Name = NameController!.text;
                          int? Empid =int.tryParse (EmpidController!.text);
                          String? Designation = Designationcontroller!.text;
                          String? project = ProjectController!.text;
                          if(Empid !=null){

                          await  FirebaseFirestore.instance
                                .collection('newtrainees')
                                .doc('project')
                                .collection('project1').doc(documentSnapshot!.id).update({
                                "Name" : Name,
                                "Empid" : Empid,
                                "Designation": Designation,
                                "project" : project,
                          });

                          }
                        },
                        child: Text(
                            'Update', style: TextStyle(color: const Color(
                            0xffffffff), fontSize: Height / 35)),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }


  Future<void> update() async {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 7), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            contentPadding: const EdgeInsets.only(left: 40, bottom: 70),
            title: const Image(image: AssetImage('assets/images/correct.png')),
            content: const Text('Member Updated Successfully',
              style: TextStyle(color: Color(0xff0038FF), fontSize: 25),),


          );
        });
  }

  Future<void> Delete() async {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 7), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            contentPadding: const EdgeInsets.only(
                left: 40, bottom: 70, top: 50),
            title: const Image(image: AssetImage("assets/images/Deleted.png")),
            content: const Text('Member Deleted Successfully',
              style: TextStyle(color: Color(0xff0038FF), fontSize: 25),),


          );
        });
  }

  // Future <void> _update()async {
  //   if(documentSnapshot != null){
  //
  //     NameController!.text = documentSnapshot['Name'];
  //     EmpidController!.text= documentSnapshot['Empid'].toString();
  //     Designationcontroller!.text= documentSnapshot['Designation'];
  //     ProjectController !.text= documentSnapshot['project'];
  //   }
  // }

  // Future<void> updateUser() async {
  //
  //     await widget.ref.update({
  //       'Name': Name, // entering name
  //       'Empid': Empid,
  //       'Designation': Designation,
  //       'project': project,})
  //         .then((value) => print("User Updated"))
  //         .catchError((error) => print("Failed to update user: $error"));
  //   }


  Future<void> DeleteUser() async {
    await FirebaseFirestore.instance.collection('newtrainees').doc('project')
        .collection('project1').
    doc('uid')
        .delete();
  }
//   await FirebaseFirestore.instance.collection('newtrainees').doc('project').collection('project1').doc(widget.data)
//       .delete({
//     'Name': FieldValue.delete(), // entering update name
//     'Empid': EmpidController,
//     'Designation': Designationcontroller,
//     'project': ProjectController})
//       .then((value) => print("User Updated"))
//       .catchError((error) => print("Failed to update user: $error"));
// }


//    Future updateData(context)async{
//      if (key.currentState.validate()) {
//        // TODo : showing any kind of alert that new changes have been saved
//        await widget.ref.update(
//          {'Name':NameController, // entering name
//
//
//
//            'Empid': EmpidController,
//            'Designation':Designationcontroller ,
//            'project': ProjectController,},
//        );
//    }
// }
}