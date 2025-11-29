import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/counter_notifier_provider.dart';

class RiverpodTest extends ConsumerStatefulWidget {
  const RiverpodTest({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RiverpodTestState();
}

class _RiverpodTestState extends ConsumerState<RiverpodTest> {
  @override
  Widget build(BuildContext context) {
    final stringState = ref.watch(stringChangeNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Riverpod test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Default text is $stringState"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(stringChangeNotifierProvider.notifier)
                        .changeTextToHello();
                  },
                  child: Text('change to Hello'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(stringChangeNotifierProvider.notifier)
                        .changeTextToWorld();
                  },
                  child: Text('change to World'),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ref.read(stringChangeNotifierProvider.notifier).reset();
              },
              child: Text('reset'),
            ),
          ],
        ),
      ),
    );
  }
}
