import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CityListScreen extends ConsumerStatefulWidget {
  const CityListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CityListScreenState();
}

class _CityListScreenState extends ConsumerState<CityListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("This is List Screen", style: TextStyle(fontSize: 20)),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text("Go Back"),
          ),
        ],
      ),
    );
  }
}
