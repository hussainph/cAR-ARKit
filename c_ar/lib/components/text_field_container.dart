import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key, 
    required this.child,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      height: size.height * .05,
      
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0, 
          color: Colors.black,
        ),
        color: Colors.white, 
        borderRadius: BorderRadius.circular(5),
        ),
        child: child,
      
      

    );
  }
}