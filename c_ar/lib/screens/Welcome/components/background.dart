import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key, 
    required this.child,
    
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(child: Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(163, 159, 255, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Image.network('https://i.ibb.co/yqn08rF/car-logo.png', fit: BoxFit.scaleDown))),
              ),
            ],
          )
              , child,
          ],
        ),

    );
  }
}
