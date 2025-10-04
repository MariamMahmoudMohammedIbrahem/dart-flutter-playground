import 'dart:math';

class FakeService {
  Future<String> fetchGreetings() async{
    await Future.delayed(const Duration(seconds: 2));
    if(Random().nextDouble() < 0.3) {
      throw Exception("Failed to fetch greetings");
    }
    return "Hello From Async!";
  }
}