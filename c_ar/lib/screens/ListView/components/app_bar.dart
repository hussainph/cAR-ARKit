import 'package:flutter/material.dart';
import 'package:c_ar/screens/UserPage/user_page.dart';

class AppBarr extends StatelessWidget {
  const AppBarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width/2,
            height: 140.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) {
                        return UserPage(
                        );
                      },
                    ),
                    );
                  },
                  child: const Icon(
                    Icons.person_rounded, size:30.0,color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.favorite_rounded, size: 30.0,color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.network('https://i.ibb.co/yqn08rF/car-logo.png', fit: BoxFit.scaleDown)),
                ),
          ],
            ),
          ),
        ),
      ],
    );
  }
}
