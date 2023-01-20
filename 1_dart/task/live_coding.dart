import 'dart:io';

/// list of numbers
/// input: [3,5,7,1,10,11,4,9]
/// sum: like 7 (example: 4+3)
/// output: index of the list e.g. 0 and 6

void main(List<String> args) {
  final inputArray = [3, 5, 7, 1, 10, 11, 4, 9];
  final inputMap = inputArray.asMap();

  final inputUser = stdin.readLineSync();

  final userNumber = int.tryParse(inputUser ?? '');

  if (userNumber == null) {
    print('user input was not a valid number');
    exit(1);
  }

  for (var number in inputMap.entries) {
    final remainingNumber = userNumber - number.value;
    final hasMatchingNumber = inputMap.entries.where((element) => element.value == remainingNumber);
    if (hasMatchingNumber.isNotEmpty) {
      print('you can build up $userNumber with the index ${hasMatchingNumber.first.key} and ${number.key}');
      exit(0);
    }
  }

  print('It was not possible to find any indexes to greate $userNumber');
}
