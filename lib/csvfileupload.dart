import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'dart:async'show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'show rootBundle;

class csvfile extends StatefulWidget {
  const csvfile({Key? key}) : super(key: key);

  @override
  State<csvfile> createState() => _csvfileState();
}

class _csvfileState extends State<csvfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: ExportData, child: Text('Export')),
            ElevatedButton(onPressed: uploadData, child: Text('upload')),

          ],
        ),
      ),
    );
  }
  void ExportData() async {
    final CollectionReference Employee = FirebaseFirestore.instance.collection("Employee");
    final MyData = await rootBundle.loadString("res/empdetails.csv");
    List<List<dynamic>> csvtable = const CsvToListConverter().convert(MyData);
    List<List<dynamic>> data = [];
    data = csvtable;
    for(var i= 0; i< data.length ; i++)
    {
      var record = {
        "sno" : data[i][0],
        "Empid" :data[i][1],
        "Name" :data[i][2],
        "DomainName" :data[i][3],
        "billable" :data[i][4],
        "Non-billable" :data[i][5],

      };
      Employee.add(record);
      print("success");

    }
  }
  void uploadData() async {
    final CollectionReference  newtrainees = FirebaseFirestore.instance.collection("newtrainees").doc('project').collection('project1');
    final MyData = await rootBundle.loadString("res/project1.csv");
    List<List<dynamic>> csvtable1 = const CsvToListConverter().convert(MyData);
    List<List<dynamic>> datas = [];
    datas = csvtable1;
    for(var i= 0; i< datas.length ; i++)
    {
      var records = {
        "Name" :datas[i][0],
        "Empid" :datas[i][1],
        "Designation" :datas[i][2],
        "project" :datas[i][3],


      };
      newtrainees.add(records);
      print("Success");

    }
  }

  }

