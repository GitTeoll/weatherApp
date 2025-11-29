import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);
final stringChangeNotifierProvider =
    NotifierProvider<StringChangeNotifier, String>(StringChangeNotifier.new);

class CounterNotifier extends Notifier<int> {
  @override
  build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = 0;
  }
}

class StringChangeNotifier extends Notifier<String> {
  @override
  build() {
    return 'sample text';
  }

  void changeTextToHello() {
    state = 'hello';
  }

  void changeTextToWorld() {
    state = 'world';
  }

  void reset() {
    state = 'sample text';
  }
}
