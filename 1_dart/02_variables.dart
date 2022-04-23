void main(){

  String outputString = 'Hello Udo!';  // initialization
  int outputInt = 2;
  double outputDouble = 42.21;
  bool boolOutput = false;

  print('outputString: $outputString.');
  print('outputInt: $outputInt.');
  print('outputDouble: $outputDouble.');
  print('boolOutput: $boolOutput.');

  outputString = 'Hello, Felix!';
  print('outputString: $outputString.');

  late int lateOutputInt; // declaration
  lateOutputInt = 42;   // allocation
  print('lateOutputInt: $lateOutputInt');

  final double finalOutputDouble = 21.21;  // can not be changed afterwards

  print('finalOutputDouble: $finalOutputDouble.');

  var varOutput = 23;     // data type is selected on allocation
  print('varOutput: $varOutput.');
}