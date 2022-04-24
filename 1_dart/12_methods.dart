void main() {
  print("before");
  pow(4);
  print("after");
  pow(60);
  pow(40);
  pow(2);
}

void pow(int x) {
  int y = x * x;
  print('result of method: ${y}');
}
