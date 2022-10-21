import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void restart() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSizeText = TextStyle(fontSize: 32);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('HomeScreen')),
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Numero de Clicks', style: fontSizeText),
            Text('$counter', style: fontSizeText)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        decreaseFn: decrease,
        restartFn: restart,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function restartFn;
  const CustomFloatingActions({
    super.key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.restartFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1),
          onPressed: () => decreaseFn(),
        ),
        FloatingActionButton(
            child: const Icon(Icons.restore), onPressed: () => restartFn()),
        FloatingActionButton(
            child: const Icon(Icons.exposure_plus_1),
            onPressed: () => increaseFn()),
      ],
    );
  }
}
