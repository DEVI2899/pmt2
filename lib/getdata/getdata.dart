import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatelessWidget {
  const GetData( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Employee');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Existing Trainees'),
        actions: const [
          Icon(Icons.search),
        ],
      ),
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc('1D3bC8NJaDPYa19ia44d').get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                children: [
                 Row(
                    children: [
                      Text(" ${data['Empid']}"),
                      Spacer(),
                      Text(" ${data['Name']}"),
                      Spacer(),
                      Text(" ${data['DomainName']}"),
                      Spacer(),
                      Text(" ${data['billable']}"),
                      Spacer(),
                      Text(" ${data['Non-billable']}"),
                      Spacer()
                    ],
                  ),
                ],
              );
            }

            return Text("loading");
          },
        ),
      ),
    );
  }
}
