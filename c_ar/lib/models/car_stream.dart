import '../../../models/car.dart';
import 'package:firebase_database/firebase_database.dart';

class CarStream{
  final _database = FirebaseDatabase.instance.reference();

  Stream<List<Car>> getCarStream() {
     late final carStream =_database.child('cars').onValue;
    final streamToPublish = carStream.map((event) {
      final carMap = Map<String, dynamic>.from(event.snapshot.value);
      final carList = carMap.entries.map((element){
        return Car.fromRTDB(Map<String, dynamic>.from(element.value));
      }).toList();
      return carList;
    });
    return streamToPublish;
  }
}