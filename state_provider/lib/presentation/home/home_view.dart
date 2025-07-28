import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider/presentation/home/controller/home_controller.dart';
import 'package:state_provider/widgets/custom_button.dart';

class HomeView extends ConsumerWidget {
  static const String id = '/home_view';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counter);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Counter App',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        toolbarHeight: 80,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                icon: Icons.add,
                bgColor: Colors.green,
                onPressed: () {
                  ref.read(counter.notifier).state++;
                },
              ),
              CustomButton(
                icon: Icons.remove,
                bgColor: Colors.red,
                onPressed: () {
                  if (count > 1) {
                    ref.read(counter.notifier).state--;
                  }
                },
              ),
              CustomButton(
                icon: Icons.refresh,
                bgColor: Colors.lightBlue,
                onPressed: () {
                  ref.read(counter.notifier).state = 0;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
