import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_details/Dashboard/Add_details.dart';
import 'package:employee_details/Dashboard/Newtrainees.dart';
import 'package:employee_details/Dashboard/update_details.dart';
import 'package:flutter/material.dart';

class Project1 extends StatefulWidget {
  const Project1({Key? key}) : super(key: key);

  @override
  State<Project1> createState() => _Project1State();
}

class _Project1State extends State<Project1> {

  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.
                  collection('newtrainees').doc('project').collection('project1').snapshots();

  CollectionReference ref = FirebaseFirestore.instance
      .collection('newtrainees')
      .doc('project')
      .collection('project1');
  // Future<int> getDataCount() {
  //   return _usersStream.length;
  //
  // }
  // @override
  // void initState(){
  //   super.initState();
  //   var counts = _usersStream.length;
  //   print('counts:$counts');
  // }

  // @override
  // void initState(){
  //   super.initState();
  //   setState(() {
  //     getDataCount();
  //     print("Data length: $_usersStream.length");
  //   });
  //}
  // Returns number of documents in users collection
  // int count = FirebaseFirestore.instance.collection('newtrainees').doc('project').collection('project1').count().get().then(
  // (res) => print(res.count),
  // onError: (e) => print("Error completing: $e"),
  // ) as int ;
  // @override
  // void initState(){
  //   super.initState();
  //   setState(() {
  //     int counts= count;
  //   });
  // }

  // void countDocuments() async {
  //   QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection('newtrainees').doc('project').collection('project1').getDocuments();
  //   List<DocumentSnapshot> _myDocCount = _myDoc.documents;
  //   print(_myDocCount.length);  // Count of Documents in Collection
  // }


  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff6C98FD),
      appBar: AppBar(
        centerTitle: true,
        leading:IconButton( onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const Newtrainee()));
        }, icon: const Icon(Icons.arrow_back ,color: Color(0xff080808),) ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            SizedBox(width:Width/10),
            Image.asset('assets/images/projecticon.png',
             // scale: 1.3,
          ),
            SizedBox(width:Width/25),
            const Text(
              'Project-1',
              style: TextStyle(color: Color(0xff1643f7)),
            ),
          ],
        ),
        backgroundColor: const Color(0xffffffff), //<-- SEE HERE
      ),
      body:  StreamBuilder<QuerySnapshot>(
          stream: usersStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('${snapshot.error}');
                 switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                   return const Center(
                     child: CircularProgressIndicator(),
                   );
                      case ConnectionState.active:
                      case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
             return const Text('No data finded!');
           }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Card(
                  elevation: Height/20,
                  margin: EdgeInsets.fromLTRB(Width/25.0, Height/30.0, Width/25.0, 0),
                  child: ListTile(
                    leading: Container(
                      height:Height/10,
                      width: Width/7,
                      decoration:  const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/sampleprofile.png'))
                      ),
                    ),
                    trailing: GestureDetector(
                        onTap: () {
                        // //  print(document.id);
                        //   Get.to(() =>update_details(data:data, ref: ref) ,
                        //   arguments: [
                        //     data = data, ref = ref
                        //   ]);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) => update_details(data:data, ref: ref)));
                          },
                        child:  Image(
                          image: const AssetImage('assets/images/icon.png'),
                          fit: BoxFit.cover,
                          height: Height/25,
                        )
                    ),
                    title: Text("${data['Name']}",style: TextStyle(color: const Color(0xff080808),fontSize: Height/35,fontWeight: FontWeight.w500),),
                    subtitle: Text("${data['Empid']}",style: TextStyle(color: const Color(0xff646965),fontSize: Height/35),)
                  ),


                );

              }).toList(),
           // itemExtent: Icon(Icons.edit_calendar_sharp),
              );
                }
              }
          ),
       floatingActionButton: SizedBox(
         height: Height/9.5,width:Width/5,
         child: FloatingActionButton(
           onPressed: () {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const Add_details()));
           },
           backgroundColor: const Color(0xff4CAF50),
           child: Icon(Icons.add, size: Height/10, ),
             ),
         ),
      );
        }


  }

