
class EmployeeModel{
  String? Empid;
  String? Designation;
  String? empname;
  String? project;
  String? uid;
  EmployeeModel({this.empname ,this.Designation, this.project , this.Empid, this.uid});

  Map<String,dynamic> toMap(){
    return {
      'uid':uid,
      'Empid': Empid,
      'project':project,
      'empname':empname,
      'Designation':Designation

    };
  }

  factory EmployeeModel.fromMap(map){
    return EmployeeModel(
      uid: map['id'],
      empname: map['empname'],
      Empid: map['Empid'],
      project: map['project'],
      Designation: map['Designation'],

    );
  }



}