void main() {
  Car car1 = Car();
  car1.setColor = "red";

  Car car2 = Car();
  car2.setColor = "blue";

  String colorFromCar1 = car1.color;

  print('color from car 1: $colorFromCar1');

  car1.whichColor();
  car2.whichColor();

  car1.drive();
}

class Car {
  //! attribute
  late String _color;

  //! setter - set attribute
  set setColor(String color){
    // here you can validate the input
    this._color = color;
  }

  //! getter
  String get color => this._color;

  //! methods
  void drive() {
    print("car is moving");
  }

  void whichColor() {
    print('car color: ${this._color}');
  }
}
