import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static final String id = "Login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal:10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Login", style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password",
                      suffixIcon: GestureDetector(
                        child: Icon(Icons.visibility,
                          color: Colors.black,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: double.infinity,
                    child:ElevatedButton(
                        child:Text("Login"),
                        // color: Colors.grey,
                        onPressed:(){}) ,
                  ),
                  Row(
                    children: [
                      Text("I don't have an account!"),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'SignUp');
                        },
                        child: Text("SignUp", style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 15,
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
