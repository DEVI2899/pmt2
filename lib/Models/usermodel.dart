

class UserModel{
  String? username;
  String? email;
  String? password;
  String? uid;
  String? Empid;
  String? Designation;
  String? empname;
  String? project;
  String? Role;


  UserModel({ this.username ,this.email, this.password , this.uid, this.Empid, this.Role });

  //data from server
  factory UserModel.fromMap(map){
    return UserModel(
      username: map['username'],
      password: map['password'],
      email: map['email'],
      Empid: map['Empid'],
      Role: map['Role'],
      uid: map['id'],
    );
  }

 //sending data from to our server

  Map<String,dynamic> toMap(){
    return {
      'username': username,
      'email':email,
      'password':password,
      'Empid': Empid,
      'uid':uid,
      'Role':Role

    };
  }
}