class Car {
  final String autotraderLink;
  final String carDescription;
  final String carEngine;
  final String carID;
  final String carMake;
  final String carModel;
  final String carType;
  final String carYear;
  final String manufacturerLink;
  final String numDoors;
  final String photoLink;
  final String starRating;




  Car({
    required this.autotraderLink,
    required this.carDescription,
    required this.carEngine,
    required this.carID,
    required this.carMake,
    required this.carModel,
    required this.carType,
    required this.carYear,
    required this.manufacturerLink,
    required this.numDoors,
    required this.photoLink,
    required this.starRating,

  });

  factory Car.fromRTDB(Map<String,dynamic> data){
    return Car(
        autotraderLink: data['autotraderLink'] ?? 'Link to car on autrotrader',
        carEngine: data['carEngine'] ?? 'Car engine',
        carID: data['carID'] ?? 'car Id',
        carMake: data['carMake'] ?? 'Care maker',
        carModel: data['carModel'] ?? 'Car model',
        carType: data['carType'] ?? 'Car type',
        carYear: data['carYear'] ?? 'Cars release year',
        manufacturerLink: data['manufacturerLink'] ?? 'Car manufacturer link',
        numDoors: data['numDoors'] ?? 'Number of car days',
        photoLink: data['photoLink'] ?? 'Link to car photo',
        starRating:data['starRating'] ?? 'Stars rating',
        carDescription: data['carDescription'] ?? 'Cars description',
    );
  }
}

