

void main() {
  bool boolOutput = false;
  print(boolOutput);
  int intOutput = -1;
  print(intOutput);
  double doubleOutput = 1.5;
  print(doubleOutput);

  String stringOutput = 'Hello, Felix';
  print(stringOutput);
  print('The value is :  $intOutput');
  print('The value is :  $boolOutput');

  dynamic dynamicVariable = 4.5;
  dynamicVariable = "text"; // can assign another datatype
  print(dynamicVariable);

  // keywords:
  late int exampleInt;
  exampleInt = 1;
  print(exampleInt);

  final int finalInt = 3;
  print(finalInt);

  const int constInt = 4;
  print(constInt);

  var varOutput = "text"; 
  // varOutput = 1 // cannot assign another datatype
  print(varOutput);

  


}