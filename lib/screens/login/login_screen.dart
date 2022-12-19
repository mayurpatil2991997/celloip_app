import 'package:celloip_task/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(191, 218, 208, 1),
      body: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Enter Email",
                        fillColor: Colors.white70),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Enter Password",
                        fillColor: Colors.white70),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  onTap: () {},
                  colorText: Color.fromRGBO(255, 255, 255, 1),
                  colorContainer: Color.fromRGBO(19, 91, 70, 0.81),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           // alignment: Alignment.center,
//           children: [
//             CustomPaint(
//               child: Container(
//                 width: width * 1,
//                 height: height * 1,
//               ),
//               painter: CurvePainter(),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Text(
//                     'Profile',
//                     style: TextStyle(
//                       fontSize: 35.0,
//                       letterSpacing: 1.5,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
