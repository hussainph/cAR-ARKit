import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedScreen extends StatefulWidget {

  final String autotraderLink, carDescription, carEngine, carMake, carModel, carType, carYear,
      numDoors, photoLink, starRating;

  const DetailedScreen({Key? key,
    required this.autotraderLink,
    required this.carEngine,
    required this.carMake,
    required this.carModel,
    required this.carType,
    required this.carYear,
    required this.numDoors,
    required this.photoLink,
    required this.starRating,
    required this.carDescription}) : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  var iconFavourite = const Icon(Icons.favorite, color: Color.fromRGBO(163, 159, 255, 1), size: 30.0,);

  @override
  Widget build(BuildContext context) {
    const textColor = Colors.black54;
    const fontSize = 15.0;

    return Scaffold(
      appBar:

      PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(115, 100, 255, 1),
          shadowColor: Colors.transparent,

        ),
      ),
      body:
      Stack(
        children: [
          Wrap(
            direction: Axis.horizontal,
            spacing: 10.0,
            runSpacing: 0.0, //
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2.4,
                color: const Color.fromRGBO(115, 100, 255, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Text(widget.carMake + " " + widget.carModel,
                      style: const TextStyle(color: Colors.white, fontSize: 25.0),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      child: Image.network(
                          widget.photoLink,
                          width: 900,
                          height: 200),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2.4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    clipBehavior: Clip.none,
                    spacing: 10.0,
                    runSpacing: 0.0,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              direction: Axis.horizontal,
                              ignoreGestures: true,
                              allowHalfRating: true,
                              itemSize: 30.0,
                              unratedColor: const Color.fromRGBO(240, 196, 24, 1),
                              itemCount: int.parse(widget.starRating),
                              itemBuilder: (context, _) =>
                              const Icon(
                                Icons.star,
                                size: 2.0,
                              ),
                              onRatingUpdate: (double value) {},
                            ),

                            GestureDetector(
                              child: Container(
                                  child: iconFavourite),
                                onTap: () {   setState(() {
                                   if(iconFavourite == const Icon(Icons.favorite, color: Color.fromRGBO(163, 159, 255, 1), size: 30.0,)) {
                                    iconFavourite = const Icon(Icons.favorite_border, color: Color.fromRGBO(163, 159, 255, 1), size: 30.0,);
                                    print(iconFavourite.toString());
                                  } else{
                                     iconFavourite = const Icon(Icons.favorite, color: Color.fromRGBO(163, 159, 255, 1), size: 30.0,);
                                     print(iconFavourite.toString());
                                  }
                                }); },
                            )],
                        ),
                      ),
                        Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,25.0,0.0,15.0),
                        child: SizedBox(
                          width: 390.0,
                            child:
                            Text(widget.carDescription, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54, fontSize: 15.0))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4.0,0.0,4.0,0.0),
                        child: SizedBox(
                          height: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text('YEAR:', style: TextStyle(color: Color.fromRGBO(115, 100, 255, 1), fontSize: fontSize)),
                                  Text('TYPE:', style: TextStyle(color: Color.fromRGBO(115, 100, 255, 1), fontSize: fontSize)),
                                  Text('MANUFACTURER:', style: TextStyle(color: Color.fromRGBO(115, 100, 255, 1), fontSize: fontSize)),
                                  Text('NO. OF DOORS:', style: TextStyle(color: Color.fromRGBO(115, 100, 255, 1), fontSize: fontSize)),
                                  Text('ENGINE', style: TextStyle(color: Color.fromRGBO(115, 100, 255, 1), fontSize: fontSize)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(widget.carYear, style: const TextStyle(color: textColor, fontSize: fontSize)),
                                  Text(widget.carType, style: const TextStyle(color: textColor, fontSize: fontSize)),
                                  Text(widget.carMake, style: const TextStyle(color: textColor, fontSize: fontSize)),
                                  Text(widget.numDoors, style: const TextStyle(color: textColor, fontSize: fontSize)),
                                  Text(widget.carEngine, style: const TextStyle(color: textColor, fontSize: fontSize)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,5.0), child : InkWell(
                          child:  Center(child:Container(
                            height: 40,
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
                            child: const Center(child: Text('BROWSE LISTINGS', style: TextStyle(color: Colors.white, fontSize: 15.0))),
                          )),
                          onTap: () => launch((widget.autotraderLink))
                      )),
                    Padding(padding: const EdgeInsets.fromLTRB(0.0,5.0,0.0,0.0), child :InkWell(
                          child:  Center(child:Container(
                            height: 40,
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
                            child: const Center(child: Text('MORE INFO', style: TextStyle(color: Colors.white, fontSize: 15.0))),
                          )),
                          onTap: () => launch((widget.autotraderLink))
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(250.0, 0.0, 0.0, 50.0),
            child: GestureDetector(child:Container(
              width: 90.0,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(163, 159, 255, 1),
                shape: BoxShape.circle,
                border: Border.all(
                    color: const Color.fromRGBO(55, 14, 163, 1), width: 0.5),
              ),
              child:
              const Center(child: Text(
                'AR', style: TextStyle(color: Colors.white, fontSize: 30.0),)),
            ), onTap: () async => await launch(('carcp317://'))
            ),
          )
        ],
      ),
    );
  }
}