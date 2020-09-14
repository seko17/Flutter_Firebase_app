import 'package:duple_firebase_app/animations/fadeAnimation.dart';
import 'package:duple_firebase_app/services/authService.dart';
import 'package:duple_firebase_app/shared/constant.dart';
import 'package:duple_firebase_app/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: -40,
                          height: 400,
                          width: width,
                          child: FadeAnimation(
                              1,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/background.png'),
                                        fit: BoxFit.fill)),
                              )),
                        ),
                        Positioned(
                          height: 400,
                          width: width + 20,
                          child: FadeAnimation(
                              1.3,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/background-2.png'),
                                        fit: BoxFit.fill)),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                              1.5,
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Color.fromRGBO(49, 39, 79, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              1.7,
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(196, 135, 198, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10),
                                      )
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        decoration: textInputDecoration
                                            .copyWith(hintText: 'email'),
                                        validator: (val) => val.isEmpty
                                            ? 'Enter an email'
                                            : null,
                                        onChanged: (val) {
                                          setState(() => email = val);
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: textInputDecoration
                                            .copyWith(hintText: 'Password'),
                                        validator: (val) => val.length < 6
                                            ? 'Enter a password 6+ chars long'
                                            : null,
                                        onChanged: (val) {
                                          setState(() => password = val);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          // FadeAnimation(1.7, Center(child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),))),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              1.9,
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 60),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color.fromRGBO(49, 39, 79, 1),
                                ),
                                child: Center(
                                  child: Container(
                                     width: 210.0,
                                    height: 120.0,
                                        child: RaisedButton(
                                       shape: new RoundedRectangleBorder(
                                         borderRadius: new BorderRadius.circular(30.0),
                                                           ),
                                      color: Color.fromRGBO(49, 39, 79, 1),
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth
                                              .signInWithEmailAndPassword(
                                                  email, password);
                                          if (result == null) {
                                            setState(() {
                                              loading = false;
                                              error =
                                                  'Could not sign in with those credentials';
                                            });
                                          }
                                        }
                                      }),
                                  ),
                            
                                ),
                              )),
                          SizedBox(
                            height: 60,
                          ),
                          FadeAnimation(
                              2,
                              Center(
                                  child: RaisedButton(
                                      onPressed: () => widget.toggleView(),
                                      color: Colors.white,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0),
                                      ),
                                      child: Text(
                                        'Create Account',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(49, 39, 79, 6)),
                                      ))
                                  // GestureDetector(
                                  //   onTap: () => widget.toggleView(),
                                  //  child: Text("Create Account", style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),)
                                  // )
                                  )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
