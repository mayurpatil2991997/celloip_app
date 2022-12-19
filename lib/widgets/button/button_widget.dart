import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback  onTap;
  final Color colorContainer;
  final Color colorText;
  const ButtonWidget({Key? key, required this.text, required this.onTap, required this.colorContainer, required this.colorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.symmetric(horizontal: 60.0),
      child: Container(
        height: 40.0,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              // border: Border.all(
              //   color: Color(0xFFF05A22),
              //   style: BorderStyle.solid,
              //   width: 1.0,
              // ),
              color: colorContainer,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: colorText,
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
