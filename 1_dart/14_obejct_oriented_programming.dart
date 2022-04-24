void main() {
  Car car1 = Car();
  car1.color = "rot";

  Car car2 = Car();
  car2.color = "blau";

  car1.whichColor();
  car2.whichColor();

  car1.drive();
}

class Car {
  //! attribute
  late String color;

  //! methods
  void drive() {
    print("car is moving");
  }

  void whichColor() {
    print('car color: ${this.color}');
  }
}
