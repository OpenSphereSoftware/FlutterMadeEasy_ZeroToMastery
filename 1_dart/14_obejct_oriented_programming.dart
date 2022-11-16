void main() {
  Car car1 = Car();

  // To test this, you need to move your Car class into a own cars.dart file
  // Dart only knows file private fields and methods, so everyone in this file
  // can access the _color attribute from a car.
  print('Using private attribute:');
  car1._color = 'blue';
  car1.carColor();

  print('Using setter:');

  car1.setColor = 'green';
  car1.carColor();
}

class Car {
  late String _color;

  set setColor(String color) {
    this._color = color;
  }

  String get color => this._color;

  void carColor() {
    print('Car is ${this._color}');
  }
}
