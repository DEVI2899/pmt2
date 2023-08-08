import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/EmployeeModel.dart';


class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final _db =  FirebaseFirestore.instance;

  Future<void> updateRecord(EmployeeModel Model)async {
    await _db.collection('newtrainees').doc('project').collection('project1')
        .doc(Model.uid).update(EmployeeModel() as Map<Object, Object?>);
  }
}