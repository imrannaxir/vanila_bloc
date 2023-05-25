import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanila_bloc/counter_bloc.dart';
import 'package:vanila_bloc/counter_event.dart';
import 'counter_state.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({required this.title, super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterBloc counterBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    counterBloc = Provider.of<CounterBloc>(context);
  }

  void _incrementCounter() {
    counterBloc.eventSink.add(IncrementCounterEvent());
  }

  void _decrementCounter() {
    counterBloc.eventSink.add(DecrementCounterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
      ),
      body: myHomePage(),
      floatingActionButton: myFloatingActionButton(),
    );
  }

  Widget myHomePage() {
    return StreamBuilder(
      stream: counterBloc.stateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CounterWidget(state: snapshot.data!);
        } else {
          return const Center(
            child: Center(
              child: Text(
                'Initial Data',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget myFloatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
        FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          child: const Icon(
            Icons.remove,
            size: 32,
          ),
        ),
      ],
    );
  }
}

class CounterWidget extends StatelessWidget {
  final CounterState state;
  const CounterWidget({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed this button many times : '),
          Text('${state.counter}')
        ],
      ),
    );
  }
}
