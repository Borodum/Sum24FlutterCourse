import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hydration.dart';
import 'notifier.dart';

class HydrationScreen extends ConsumerWidget {
  const HydrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO - Add ref.watch and use provider to get the water intake
    final waterIntake = ref.watch(waterIntakeProvider);

    return Scaffold(
      // TODO add AppBar with Icon to reset the water intake as actions parameter of AppBar
      appBar: AppBar(
        title: Text("Aqua Max"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[],
        leading: IconButton(
          onPressed: (){
            ref.read(waterIntakeProvider.notifier).reset();
          },
          icon: Icon(Icons.refresh),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TODO - Add text to display the water intake
            Text("Level of water: " + waterIntake.toString() + " ml"),
            // TODO add HydrationWidget to display the water intake and put waterIntake into it
            HydrationWidget(waterIntakeLevel: waterIntake,)
            // Add more UI components if necessary
          ],
        ),
      ),
      // TODO - Add floating action button to increment the water intake using ref.read(waterIntakeProvider.notifier).increment(x)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: (){ref.read(waterIntakeProvider.notifier).increment(100);},
      ),

    );
  }
}