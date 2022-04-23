import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'count_controller.dart';

void main() {
  Get.put(CountController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  final CountController controller = Get.find();

  CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with GetX'),
        centerTitle: true,
      ),
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: const Icon(Icons.add)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button',
              ),
              GetBuilder<CountController>(
                builder: (_) => Text(
                  '${controller.count.toInt()}',
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                controller.decrement();
              },
              child: const Icon(Icons.remove)),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.restart();
        },
        child: const Icon(
          Icons.repeat,
        ),
      ),
    );
  }
}
