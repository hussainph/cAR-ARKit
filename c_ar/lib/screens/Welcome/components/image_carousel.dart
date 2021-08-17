import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  var carouselList = [
    'https://i.ibb.co/3Nr2b5h/card1.png',
    'https://i.ibb.co/nrsygy5/card2.png',
    'https://i.ibb.co/grcqwq0/card3.png'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: SizedBox(
        height: 200.0,
        width: 200.0,
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (_, i) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                width: 100.0,
                child:
                Image.network(carouselList[i], fit: BoxFit.scaleDown));
          },
        ),
      ),
    );
    }
  }
