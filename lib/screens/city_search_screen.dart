import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CitySearchScreen extends ConsumerStatefulWidget {
  const CitySearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CitySearchScreenState();
}

class _CitySearchScreenState extends ConsumerState<CitySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This is city search page", style: TextStyle(fontSize: 20)),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: Text("Go Back"),
        ),
      ],
    );
  }
}
