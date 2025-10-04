import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerServiceProvider = Provider((ref) => TimerService());

class TimerService {
  Stream<int> tick() {
    return Stream.periodic(const Duration(seconds: 1), (count) => count);
  }

  Stream<int> tickWithError() async* {
    for(int i = 0; i<5 ; i++){
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
    throw Exception("Timer Stopped Unexpectedly");
  }
}