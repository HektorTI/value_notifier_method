import 'package:flutter/material.dart';

import 'controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Controller _controller = Controller();

  // @override
  // void initState() {
  //   super.initState();

  //   _controller.addListener(() {
  //     setState(() {});
  //   });

  //   _controller.addListener(() => _update);
  // }

  void updateBySetState() {
    _controller.counter.value++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Recriando Tela ${_controller.counter}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // AnimatedBuilder(
            //   animation: _controller.counter,
            //   builder: (context, child) {
            //     return Text(
            //       '${_controller.counter}',
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),
            ValueListenableBuilder(
              valueListenable: _controller.counter,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  // '${_controller.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),

            Switch(
                value: _controller.isOn,
                onChanged: (value) {
                  _controller.seIson();
                  setState(() {});
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _controller.isOn ? _controller.incrementCounter : updateBySetState,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
