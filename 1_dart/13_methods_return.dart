void main() {
  print("start");
  int number1 = 4;
  int number2 = 5;
  int result1 = add(num1: number1, num2: number2);
  print(result1);
  int result2 = add(num1: result1, num2: number2);
  print(result2);
  print("end");
}

int add({required int num1, required int num2}) {
  int result = num1 + num2;
  return result;
}
