import 'package:employee_details/Screens/LoginScreen.dart';
import 'package:employee_details/Screens/RegisterScreen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: Height,
        width:Width,
        color: const Color(0xff6C98FD),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Height/16),
              child: const Image(image: AssetImage('assets/images/Home.png')),
            ),
             Padding(
               padding: EdgeInsets.only(top: Height/30),
               child:  Text('Trainee Tracking', style: TextStyle(color: const Color(0xff080808), fontWeight: FontWeight.bold, fontSize: Height/20),),
             ),
             Padding(
               padding: EdgeInsets.only(top:Height/29, left: Width/8),
               child: Text('The app enables the organizations to monitor and track the progress of their trainees',
                   style:TextStyle(fontSize: Height/39,fontWeight: FontWeight.w600, color: const Color(0xff0029FF))),
             ),
             Padding(
               padding:  EdgeInsets.only(top: Height/22),
               child: SizedBox(
                 height: Height/15,width: Width/3,
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: const Color(0xff1643f7),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(Height/45)
                     )
                   ),
                     onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                     }, child:  Text('LOGIN', style: TextStyle(color: const Color(0xffffffff),fontSize: Height/40)),
               ),
             )),
             Padding(
               padding:  EdgeInsets.only(top: Height/30),
               child: SizedBox(
                 height: Height/15,width: Width/3,
                 child: OutlinedButton(
                   style: OutlinedButton.styleFrom(
                     side: const BorderSide(color: Color(0xfffcfcfc)),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(Height/45)
                       )
                   ),
                   child:  Text("SIGN UP", style: TextStyle(color: const Color(0xff1643f7),fontSize: Height/40),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                  },
            ),
               ),
             ),

          ],
        ),
      ),
    );
  }
}
