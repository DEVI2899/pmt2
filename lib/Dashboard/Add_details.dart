import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/Dashboard/Dashboard_project1.dart';
import 'package:flutter/material.dart';

class Add_details extends StatefulWidget {
  const Add_details({Key? key}) : super(key: key);

  @override
  State<Add_details> createState() => _Add_detailsState();
}

class _Add_detailsState extends State<Add_details> {

  TextEditingController NameController =TextEditingController();
  TextEditingController EmpidController =TextEditingController();
  TextEditingController Designationcontroller =TextEditingController();
  TextEditingController ProjectController =TextEditingController();

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance.collection('newtrainees').doc('project').collection('project1')
        .add({
      'Name': NameController.text, // entering name
      'Empid': EmpidController.text,
      'Designation': Designationcontroller.text,
      'project': ProjectController.text
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff6C98FD),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon:const Icon(Icons.arrow_back),color: const Color(0xff080808), onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const Project1()));
        },) ,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: EdgeInsets.only(right: Width/8),
              child: const Text(
                'Add-Member',
                style: TextStyle(color: Color(0xff1643f7)),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xffffffff), //<-- SEE HERE
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Padding(
              padding:   EdgeInsets.all(Height/40),
              child: Container(height: Height/1.8,
                width: Width,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(Height/70) ,
                  color:  const Color(0xffffffff),
                ),
                child: Column(
                  children:<Widget> [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Width/10,top: Height/20),
                          child:Text('Photo' , style: TextStyle(color: const Color(0xff080808), fontWeight: FontWeight.normal,fontSize: Width/20),),
                        ),
                        SizedBox(width: Width/3.5),
                        Padding(
                          padding: EdgeInsets.only(top: Height/40),
                          child: Container(
                            height: Height/10,
                            width: Width/6,
                            decoration:   BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(color:const Color(0xffbac2bc)),
                              //  shape: BoxShape.circle,
                                //color: Color(0xffbac2bc),
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/cameraicon.png'))
                            ),
                            child: GestureDetector(
                              onTap: (){},
                            ),

                          ),
                        ),
                      ],
                    ),
                    Row(
                      children:<Widget> [
                        Padding(
                          padding: EdgeInsets.only(left: Width/10,top: Height/25),
                          child: Text('Name' , style: TextStyle(color: const Color(0xff080808), fontWeight: FontWeight.normal,fontSize: Width/20),),
                        ),

                        SizedBox(width: Width/5),
                        Padding(
                          padding: EdgeInsets.only(top: Height/30),
                          child: SizedBox(
                            height:Height/20,width: Width/2.3,
                            child: TextFormField(
                              controller: NameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Height/100),

                                ),
                              ),

                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children:<Widget> [
                        Padding(
                          padding: EdgeInsets.only(left: Width/10,top: Height/20),
                          child: Text('Emp-id' , style: TextStyle(color: const Color(0xff080808), fontWeight: FontWeight.normal,fontSize: Width/20),),
                        ),

                        SizedBox(width: Width/5.5),
                        Padding(
                          padding: EdgeInsets.only(top: Height/30),
                          child: SizedBox(
                            height:Height/20,width: Width/2.3,
                            child: TextFormField(
                              controller: EmpidController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Height/100),

                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children:<Widget> [
                        Padding(
                          padding: EdgeInsets.only(left: Width/10,top: Height/20),
                          child: Text('Designation' , style: TextStyle(color: const Color(0xff080808), fontWeight: FontWeight.normal,fontSize: Width/20),),
                        ),

                        SizedBox(width: Width/12.5),
                        Padding(
                          padding: EdgeInsets.only(top: Height/30),
                          child: SizedBox(
                            height:Height/20,width: Width/2.3,
                            child: TextFormField(
                              controller: Designationcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Height/100),


                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children:<Widget> [
                        Padding(
                          padding: EdgeInsets.only(left: Width/10,top: Height/20),
                          child: Text('Project' , style: TextStyle(color: const Color(0xff080808), fontWeight: FontWeight.normal,fontSize: Width/20),),
                        ),

                        SizedBox(width: Width/5.4),
                        Padding(
                          padding: EdgeInsets.only(top: Height/30),
                          child: SizedBox(
                            height:Height/20,width: Width/2.3,
                            child: TextFormField(
                              controller: ProjectController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Height/100),

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
                  padding:  EdgeInsets.only(top: Height/30,left: Width/16),
                  child: SizedBox(
                    height: Height/15,width: Width/2.6,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xfffcfcfc)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Height/90)
                          )
                      ),
                      child:  Text("Cancel", style: TextStyle(color: const Color(0xff1643f7),fontSize: Height/30),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const Project1()));
                      },
                    ),
                  ),
                ),
                Padding(
                    padding:  EdgeInsets.only(top: Height/32, left: Width/8),
                    child: SizedBox(
                      height: Height/15,width: Width/2.6,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff1643f7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Height/90)
                            )
                        ),
                        onPressed: (){
                           addUser();
                           dialogBuilder();
                           NameController.clear();
                           EmpidController.clear();
                           Designationcontroller.clear();
                           ProjectController.clear();
                         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Project1()));
                        }, child:  Text('Add', style: TextStyle(color: const Color(0xffffffff),fontSize: Height/30)),
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );

  }

  Future<void> dialogBuilder() async {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 7), () {
            Navigator.of(context).pop(true);
          });
          return  AlertDialog(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              ),
                contentPadding: const EdgeInsets.only( left: 60, bottom: 60),
                title: const Image(image: AssetImage('assets/images/correct.png')),
                content: const Text('Member Added Successfully',
                  style: TextStyle(color:Color(0xff0038FF), fontSize: 25 ),),


          );
        });
  }
}