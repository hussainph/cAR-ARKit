import 'package:c_ar/screens/SignIN/components/background.dart';
import 'package:c_ar/screens/SignUp/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:c_ar/screens/ListView/home.dart';
import 'package:firebase_core/firebase_core.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _logIn() async{
    try {
      await  FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      return Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Home()));
    } on FirebaseAuthException catch (e){
      var message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'You have entered an invalid email, please try again';
          break;
        case 'user-disabled':
          message = 'The account has been disabled, please try again';
          break;
        case 'user-not':
          message = 'This account does not exist, please try again';
          break;
        case 'wrong-password':
          message = 'You have entered the wrong password, please try again';
          break;
      }

      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text('Sign in failed'),
          content: Text(message, style: const TextStyle(color: Colors.black),),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: const Text('Ok')),
          ],
        );
      });
    }
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
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
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          const Text(
                            'Email *',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color.fromRGBO(115, 100, 255, 1),
                              ),
                              hintText:'Enter Your Email Address',
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Password *',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: size.width * 0.6,
                      height: size.height * .056,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 0.5),
                        borderRadius: BorderRadius.circular(29),),
                      child: ClipRRect(
                        child: TextButton(
                            onPressed: () {
                              _logIn();
                            },
                            child: const Text(
                                'Sign in',
                                style: TextStyle(fontSize: 18, color: Color.fromRGBO(24, 44, 175, 1)))
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
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),

                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          },
                        ),
                        );
                      },
                      child: const Text('Sign Up'),
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
                  'SIGN IN',
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
