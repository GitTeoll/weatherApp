import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/counter_notifier_provider.dart';

class Counterpage extends ConsumerStatefulWidget {
  const Counterpage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterpageState();
}

class _CounterpageState extends ConsumerState<Counterpage> {
  @override
  Widget build(BuildContext context) {
    // final counter = ref.watch(countProvider);
    final counter = ref.watch(counterNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Riverpod part1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Number Count = $counter", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // ref.read(countProvider.notifier).state++;
                    ref.read(counterNotifierProvider.notifier).increment();
                  },
                  child: Text("Plus"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // ref.read(countProvider.notifier).state--;
                    ref.read(counterNotifierProvider.notifier).decrement();
                  },
                  child: Text("Minus"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterNotifierProvider.notifier).reset();
                  },
                  child: Text("reset"),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/page2');
              },
              child: Text('Page2로 가기'),
            ),
          ],
        ),
      ),
    );
  }
}
