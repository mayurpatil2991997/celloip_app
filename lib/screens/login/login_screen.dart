import 'dart:convert';

import 'package:celloip_task/base_url/common_base_url.dart';
import 'package:celloip_task/core/routes.dart';
import 'package:celloip_task/model/login/login_model.dart';
import 'package:celloip_task/screens/home/home_screen.dart';
import 'package:celloip_task/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future<LoginModel> login(
      String email, String password, BuildContext context) async {
    try {

      final response = await http.post(
        Uri.parse('${BaseUrl.Url}/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        print("LoginREsponseeee $responseJson");
        if (responseJson['token'] != null) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Logged in successfully")));
          Navigator.pushReplacementNamed(context, CTRoutes.list_data);
        }
      } else {
        setState(() {
          isLoading = false;
        });
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("User not found")));
      }
    } catch (e) {
      print("CatchLogin $e");
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid email or password")));
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(191, 218, 208, 1),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              CustomPaint(
                child: Container(
                  height: height * 0.5,
                ),
                painter: CurvePainter(),
              ),
              Column(
                children:  [
                  const Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: Text(
                        "Smartr",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 250.0,
                  ),
                  const Center(
                    child: Text(
                      "Let’s get you started",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  emailWidget(),
                  SizedBox(
                    height: 16,
                  ),
                  passwordWidget(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/tc.png',
                          width: 20.0,
                          height: 10.0,
                          color: Colors.black,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "By signing up, you will declare that you read and ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.0,
                                // fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              "understand the Smartr Services Agreement.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.0,
                                // fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26.0,
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Text(
                       "Already have an account?  ",
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 10.0,
                         // fontWeight: FontWeight.w500
                       ),
                     ),
                     const Text(
                       "Sign in",
                       style: TextStyle(
                         color: Colors.blue,
                         fontSize: 10.0,
                         // fontWeight: FontWeight.w500
                       ),
                     ),
                   ],
                 ),
                  SizedBox(
                    height: 14.0,
                  ),
                  ButtonWidget(
                    text: "GET STARTED",
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                      } else if (!_formKey.currentState.validate()) {
                        return;
                      } else {
                        return null;
                      }
                      setState(() {
                        login(emailController.text, passwordController.text, context);
                        isLoading = true;
                      });
                    },
                    colorText: Color.fromRGBO(255, 255, 255, 1),
                    colorContainer: Color.fromRGBO(19, 91, 70, 0.81),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget emailWidget() {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextFormField(
        controller: emailController,
        validator: (value) {
          if (value.isEmpty) {
            return "Please Enter Email";
          } else if (!(regex.hasMatch(value))) {
            return "Please Enter Valid Email";
          }
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: "Enter Email",
            fillColor: Colors.white70),
      ),
    );
  }
  Widget passwordWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          if (value == null) {
            return 'Please Enter Password';
          } else if (value.length < 3) {
            return 'Password must be more than 2 charater';
          } else if (value.length > 16) {
            return 'Password must be less than 16 charater';
          }
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: "Enter Password",
            fillColor: Colors.white70),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color.fromRGBO(18, 170, 115, 1);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    // path.moveTo(0, size.height * 0.25);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.5, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    // path.close();
    // path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
