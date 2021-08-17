import 'package:c_ar/components/rounded_button.dart';
import 'package:c_ar/screens/SignIN/sign_in_screen.dart';
import 'package:c_ar/screens/SignUp/sign_up_screen.dart';
import 'package:c_ar/screens/Welcome/components/background.dart';
import 'package:flutter/material.dart';
import 'package:c_ar/screens/Welcome/components/image_carousel.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          SizedBox(
            height: (MediaQuery.of(context).size.height) / 2,
            width: MediaQuery.of(context).size.width,
            child: const ImageCarousel(

            ),
          ),
          RoundedButton(
            press: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context){
                    return const SignUpScreen();
                  },
                ),
              );
            }, 
          text: 'Sign up', 
          width: size.width * 0.8,
          ),

           Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          height: size.height * .065,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 0.5),
            borderRadius: BorderRadius.circular(29),

          ),
          child: ClipRRect(

          child: TextButton(
          onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context){
          return const SignInScreen();
          },
          ),
          );
          },
          child: const Text(
          'Sign in',
          style: TextStyle(color: Color.fromRGBO(24, 44, 175, 1)))
          ),
          ),
          )
          ],
        ),
      )
    );
  }
}

