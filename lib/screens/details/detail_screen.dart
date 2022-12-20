import 'package:celloip_task/core/routes.dart';
import 'package:celloip_task/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key}) : super(key: key);

  // Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 80.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, CTRoutes.list_data);
                    },
                    child: Image.asset(
                      'assets/images/back.png',
                      width: 30.0,
                    ),
                  ),
                  Icon(Icons.favorite),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.greenAccent[400],
                backgroundImage: AssetImage("assets/images/logo1.png"),
                radius: 22, //Text
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Junior UX Designer",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "Canva",
                style: TextStyle(
                    color: Color.fromRGBO(67, 69, 69, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "Posted on 3 March ",
                style: TextStyle(
                    color: Color.fromRGBO(67, 69, 69, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10.0,
              ),
              new Divider(
                color: Color.fromRGBO(191, 218, 208, 1),
                thickness: 5.0,
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "APPLY BEFORE",
                        style: TextStyle(
                            color: Color.fromRGBO(67, 69, 69, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "03 June, 2022",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text("SALARY RANGE",
                        style: TextStyle(
                            color: Color.fromRGBO(67, 69, 69, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("40k - 60k/yearly",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "JOB NATURE",
                          style: TextStyle(
                              color: Color.fromRGBO(67, 69, 69, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        // SizedBox(
                        //   height: 6.0,
                        // ),
                        Transform(
                          transform: new Matrix4.identity()..scale(0.80),
                          child: Chip(
                            elevation: 0,
                            backgroundColor: Color.fromRGBO(191, 218, 208, 1),
                            shadowColor: Colors.black,
                            label: Text(
                              'Full-time',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ), //Text
                          ),
                        ),
                        Text("JOB LOCATION",
                          style: TextStyle(
                              color: Color.fromRGBO(67, 69, 69, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text("Work from anywhere",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              new Divider(
                color: Color.fromRGBO(191, 218, 208, 1),
                thickness: 5.0,
              ),
              SizedBox(
                height: 12.0,
              ),
              Text("JOB DESCRIPTION ",
                style: TextStyle(
                    color: Color.fromRGBO(67, 69, 69, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text("Can you bring creative human-centered ideas to life and make great things happen beyond what meets the eye?",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),
              Text("We believe in teamwork, fun, complex projects, diverse perspectives, and simple solutions. How about you? We're looking for a like-minded",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              Row(
                children: [
                  Text("See more",
                    style: TextStyle(
                        color: Color.fromRGBO(15, 172, 116, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Image.asset(
                    'assets/images/down.png',
                    width: 20.0,
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              new Divider(
                color: Color.fromRGBO(191, 218, 208, 1),
                thickness: 5.0,
              ),
              SizedBox(
                height: 30.0,
              ),

              // Custom Button
              ButtonWidget(
                text: "Apply Now",
                onTap: () {},
                colorText: Color.fromRGBO(255, 255, 255, 1),
                colorContainer: Color.fromRGBO(19, 91, 70, 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
