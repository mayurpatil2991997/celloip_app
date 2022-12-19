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
      body: Stack(
        children: [
          CustomPaint(
            child: Container(
              height: height * 0.5,
            ),
            painter: CurvePainter(),
          ),
        ],
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
    path.lineTo(0,size.height);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height - 100,
      size.width,
      size.height
       );
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
