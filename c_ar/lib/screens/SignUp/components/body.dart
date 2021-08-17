import 'package:c_ar/screens/SignIN/sign_in_screen.dart';
import 'package:c_ar/screens/SignUp/components/background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Wrap(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:35, right: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          SizedBox(
                            height: 80,
                          ),

                          Text(
                            'Full Name *',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.account_circle_rounded,
                                color: Color.fromRGBO(115, 100, 255, 1),
                              ),
                              hintText:'Enter Full Name',
                            ),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email *',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color.fromRGBO(115, 100, 255, 1),
                              ),
                              hintText:'Enter Your Email Address',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Password *',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Color.fromRGBO(115, 100, 255, 1),
                              ),
                              hintText:'Enter Password',
                            ),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Confirm Password *',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Color.fromRGBO(115, 100, 255, 1),
                              ),
                              hintText:'Confirm Password',
                            ),
                            obscureText: true,
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: size.width * 0.6,
                      height: size.height * .056,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(24, 44, 175, 1),
                        border: Border.all(color: Colors.black54, width: 0.5),
                        borderRadius: BorderRadius.circular(29),),
                      child: ClipRRect(
                        child: TextButton(
                            onPressed: () {
                            },
                            child: const Text(
                                'Sign up',
                                style: TextStyle(fontSize: 18, color: Colors.white))
                        ), ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: size.width * 0.6,
                      height: size.height * .056,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(37, 68, 219, 1),
                        borderRadius: BorderRadius.circular(10),),
                      child: ClipRRect(
                        child: TextButton(
                            onPressed: () {
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon( Icons.facebook, color: Colors.white,),
                                Text(
                                    'Continue with Facebook',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            )
                        ), ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      width: size.width * 0.6,
                      height: size.height * .056,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(235, 57, 57, 1),
                        borderRadius: BorderRadius.circular(10),),
                      child: ClipRRect(
                        child: TextButton(
                            onPressed: () {
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
                                Image.network(
                                  "https://img.icons8.com/ios-glyphs/30/000000/google-logo--v1.png",color: Colors.white,
                                ),
                                const Text(
                                    'Continue with Google    ',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            )
                        ), ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),

                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) {
                            return const SignInScreen();
                          },
                        ),
                        );
                      },
                      child: const Text('Sign In'),
                      style: TextButton.styleFrom(
                        primary: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(35, 150, 0, 0),
                child: Text(
                  'SIGN UP',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    color:Color.fromRGBO(24, 44, 175, 1),

                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}