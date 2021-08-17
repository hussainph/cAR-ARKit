import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    //SignOut
    void signOut() {
      auth.signOut();
    }

    return Scaffold(

      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(115, 100, 255, 1),
            child: Center(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: Colors.white),
                height:MediaQuery.of(context).size.height - 60,
                width:MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(90.0,160.0,90.0,0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('John Smith',style: TextStyle(fontSize: 35.0),),
                            const Divider(
                              color: Color.fromRGBO(163, 159, 255, 1),
                              thickness: 1.3,
                              height: 0.0,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  const [
                            Text('Update Info', style: TextStyle(fontSize: 22.0),),
                            Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(163, 159, 255, 1), size: 15.0,)],),
                      ),

                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                          const [Text('About', style: TextStyle(fontSize: 22.0),),
                            Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(163, 159, 255, 1), size: 15.0)
                          ],),
                      ),
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Help', style: TextStyle(fontSize: 22.0),),
                            Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(163, 159, 255, 1), size: 15.0)
                          ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 140.0, bottom: 80.0),
                        child: GestureDetector(
                            child:  Center(child:Container(
                              height: 50,
                              width: 200,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(29),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color.fromRGBO(115, 100, 255, 1),
                                      Color.fromRGBO(163, 159, 255, 1),
                                    ],
                                  )),
                              child:  Center(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Log Out', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                                  Icon(Icons.logout_outlined, color: Colors.white)
                                ],
                              )),
                            )),
                            onTap: () {
                              signOut();
                            }
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(color: const Color.fromRGBO(115, 100, 255, 1),),
          ),Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
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
          ),
        ],
      ),
    );
  }
}