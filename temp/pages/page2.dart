import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('This is page2')),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: Text('Go Back'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/riverpodTest');
                  },
                  child: Text("RiverpodTest"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
