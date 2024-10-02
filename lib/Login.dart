import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static final String id = "Login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return _buildPortraitLayout(context);
              } else {
                return _buildLandscapeLayout(context);
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    // Portrait layout remains unchanged
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildEmailField(),
                _buildPasswordField(),
                _buildLoginButton(),
                _buildSignUpRow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildEmailField(isLandscape: true),
                      SizedBox(height: 20),
                      _buildPasswordField(isLandscape: true),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildLoginButton(isLandscape: true),
                      SizedBox(height: 20),
                      _buildSignUpRow(context),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField({bool isLandscape = false}) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Email",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        contentPadding: isLandscape
            ? EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            : null,
      ),
    );
  }

  Widget _buildPasswordField({bool isLandscape = false}) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Password",
        suffixIcon: GestureDetector(
          child: Icon(
            Icons.visibility,
            color: Colors.black,
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        contentPadding: isLandscape
            ? EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            : null,
      ),
    );
  }

  Widget _buildLoginButton({bool isLandscape = false}) {
    return Container(
      height: isLandscape ? 40 : 45,
      width: isLandscape ? 200 : double.infinity,
      child: ElevatedButton(
        child: Text("Login"),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("I don't have an account!"),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'SignUp');
          },
          child: Text(
            "SignUp",
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}