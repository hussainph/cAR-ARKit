import 'package:c_ar/models/car_stream.dart';
import 'package:c_ar/screens/DetailedView/detailed_view.dart';
import 'package:flutter/material.dart';
import '../../../models/car.dart';
import 'package:c_ar/screens/ListView/components/app_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListViewer extends StatelessWidget {
  const ListViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(115, 100, 255, 1),
      child: Column(
        children: [
          const AppBarr(),
          StreamBuilder(
              stream: CarStream().getCarStream(),
              builder: (context, snapshot) {
              final cardList = <Padding>[];
              if (snapshot.hasData) {
                final displayCars = snapshot.data as List<Car>;
                cardList.addAll(
                  displayCars.map((nextCar){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 15.0),
                      child: GestureDetector(
                        onTap: (){
                      Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) {
                      return DetailedScreen(
                          autotraderLink: nextCar.autotraderLink,
                          carDescription: nextCar.carDescription,
                          carEngine: nextCar.carEngine,
                          carMake: nextCar.carMake,
                          carModel: nextCar.carModel,
                          carType: nextCar.carType,
                          carYear: nextCar.carYear,
                          numDoors: nextCar.numDoors,
                          photoLink: nextCar.photoLink,
                          starRating: nextCar.starRating,
                          );
                      },
                      ),
                      );
                      },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                            side: const BorderSide(
                              color: Color.fromRGBO(24, 44, 175, 1),
                              width: 1.0,
                            ),
                          ),
                          color: Colors.white,
                          child: SizedBox(
                            width: 20.0,
                            height: 220.0,
                            child: Wrap(
                              spacing: 5.0,
                              runSpacing: 20.0,
                              direction: Axis.horizontal, // main axis (rows or columns)
                              children: [
                                SizedBox(
                                  height: 180.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(nextCar.carMake + " " + nextCar.carModel, style: const TextStyle(fontSize: 20.0, color: Color.fromRGBO(115, 100, 255, 1), fontWeight: FontWeight.w300)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20.0),
                                            child: Image.network(nextCar.photoLink,
                                                width: 180,
                                                height: 120,
                                                fit:BoxFit.fill ),
                                          ),
                                          SizedBox(
                                            height: 100.0,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("YEAR: " + nextCar.carYear, style: const TextStyle(color: Colors.black54)),
                                                Text("TYPE: " + nextCar.carType, style: const TextStyle(color: Colors.black54)),
                                            RatingBar.builder(
                                              direction: Axis.horizontal,
                                              ignoreGestures: true,
                                              allowHalfRating: true,
                                              itemSize: 20.0,
                                              unratedColor: Colors.amberAccent,
                                              itemCount: int.parse(nextCar.starRating),
                                              itemBuilder: (context, _) => const Icon(
                                                Icons.star,
                                                size: 2.0,
                                              ), onRatingUpdate: (double value) {  },
                                            )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ),
                      ));
                  }),
                );

                return Expanded(
                  child: ListView(
                    children: cardList,
                  ),
                );
              }
              else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              }),
        ],
      ),
    );
  }

}


