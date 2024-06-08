
  import 'dart:math';
  Future<int> fetchNumber() async {
    await Future.delayed(const Duration(seconds: 2)); 
    return Random().nextInt(100); 
  }