import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback press;
  final Color color, textColor;
  const RoundedButton({
    Key? key, 
    this.textColor = Colors.white,
    this.color = const Color.fromRGBO(24, 44, 175, 1),
    required this.text, 
    required this.press, 
    required this.width,
    
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40 ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),),
      backgroundColor: color,

    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      height: size.height * .065,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29), 
          child: TextButton(
              style: flatButtonStyle,
              onPressed: press,
            child: Text(
              text,
              style: TextStyle(color: textColor))
            ),
        ),
    );
  }
}

