import 'package:celloip_task/core/routes.dart';
import 'package:celloip_task/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width * 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Color.fromRGBO(18, 170, 115, 1),
              Color.fromRGBO(19, 91, 70, 0.81),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Smartr",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const CircleAvatar(
                // radius : 20.0,
                backgroundImage: AssetImage(
                  'assets/images/men.png',
                ),
                radius: 80,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                height: 18.0,
              ),
              const Text(
                "Fresh look, same login.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/arrow.png',
                    width: 20.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "SmartRecruiters",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          // fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "candidate portal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          // fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "is now Smartr.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          // fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logout.png',
                      width: 20.0,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Enter the same login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "info used for your",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "SmartrProfile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/refresh.png',
                      width: 20.0,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "If login details were",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "saved, you may",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "need to re-save.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                "Why Smartr? Read here",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  // fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
               ButtonWidget(
                text: "GET STARTED",
                onTap: () {
                  Navigator.pushReplacementNamed(context, CTRoutes.login);
                },
                colorContainer: const Color.fromRGBO(191, 219, 209, 1),
                colorText: const Color.fromRGBO(19, 91, 70, 0.81),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
