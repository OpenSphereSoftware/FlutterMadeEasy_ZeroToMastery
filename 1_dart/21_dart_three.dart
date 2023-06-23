void main(List<String> args) {
  final (first, last) = records();
  print(first);
  print(last);

  final describedDate = describeDate(DateTime.now());
  print(describedDate);

  final soundOfAnimal = whatDoesItSounds(Lion());
  print(soundOfAnimal);
}

String describeDate(DateTime dt) => switch (dt.weekday) {
      1 => 'Feeling relaxed after the weekend?',
      6 || 7 => 'WEEKEND; HURRAY!',
      _ => 'Hang in there'
    };

(String, String) records() {
  final firstName = 'Max';
  final lastName = 'Steffen';

  return (firstName, lastName);
}

String whatDoesItSounds(Animal animal) =>
    switch (animal) { Cow c => '$c moo', Sheep s => '$s says baa', Pig _ => 'oink', _ => 'unknown' };

abstract interface class DoSth {
  void myMethod();
}

class WeDoSth implements DoSth {
  @override
  void myMethod() {
    // TODO: implement myMethod
  }
}

sealed class Animal {}

class Cow extends Animal {}

class Sheep extends Animal {}

class Pig extends Animal {}

class Lion extends Animal {}
