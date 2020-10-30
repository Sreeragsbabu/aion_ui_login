import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 320,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
              ClipPath(
                clipper: MyClipper2(),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    _topCircle(),
                    _loginBox(context),
                    _middleCircle(),
                  ],
                ),
                _sizedBox30(),
                _orLoginText(),
                _sizedBox10(),
                _facebookLoginButton(),
                _googleLoginButton(),
                _sizedBox20(),
                _registerButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //widgets
  Widget _topCircle() {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 50),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  Widget _loginBox(context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.only(top: 200, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).hintColor.withOpacity(0.2),
                offset: Offset(0, 10),
                blurRadius: 20)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w500),
              )),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Email (Required)",
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor))),
          ),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: "Password (Required)",
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor))),
          ),
          _sizedBox20(),
          Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: () {
                    // debugPrint("clicked");
                  },
                  child: Text("Forgot Password?"))),
          _sizedBox20(),
        ],
      ),
    );
  }

  Widget _middleCircle() {
    return Padding(
      padding: const EdgeInsets.only(right: 30, top: 380),
      child: Align(
        alignment: Alignment.topRight,
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.blue,
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(20.0),
          shape: CircleBorder(),
        ),
      ),
    );
  }

  Widget _orLoginText() {
    return Container(
      child: Text(
        "or Login with",
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget _facebookLoginButton() {
    return RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            FontAwesomeIcons.facebook,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "Login with Facebook",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _googleLoginButton() {
    return RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      color: Colors.blue.shade700,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "images/google_g.png",
            width: 35,
            height: 35,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "Sign in with google",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _registerButton() {
    return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: GestureDetector(
              onTap: () {},
              child: Text(
                "REGISTER",
                style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              )),
        ));
  }

  Widget _sizedBox10() {
    return SizedBox(
      height: 10,
    );
  }

  Widget _sizedBox20() {
    return SizedBox(
      height: 20,
    );
  }

  Widget _sizedBox30() {
    return SizedBox(
      height: 30,
    );
  }

  Widget _sizedBox50() {
    return SizedBox(
      height: 50,
    );
  }
}

//clipper classes

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    path.arcToPoint(Offset(size.width * 0.3, 0), radius: Radius.circular(220));
    //path.lineTo(size.width * 0.2, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, 0.0);
    path.arcToPoint(Offset(size.width * 0.5, size.height),
        radius: Radius.circular(200));
    path.lineTo(0.0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
