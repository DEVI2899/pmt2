import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Employee').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: const Text('Existing Trainees'),
        actions: const [
          Icon(Icons.search),
        ],
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Column(
                  children: [
                    Row(
                      children: [
                        Text("${data['Empid']}"),

                        Spacer(),
                        Text("${data['Name']}"),
                        Spacer(),
                        Text("${data['DomainName']}"),
                        Spacer(),
                        Text("${data['billable']}"),
                        Spacer(),
                        Text("${data['Non-billable']}"),
                        Spacer()


                      ],
                    ),
                  ],
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}