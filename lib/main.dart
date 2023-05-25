import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanila_bloc/counter_bloc.dart';
import 'home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CAS',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Provider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: const MyHomePage(title: 'CASIAN DEVELOPER\'S'),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vanila_bloc/counter_bloc.dart';
// import 'package:vanila_bloc/counter_state.dart';

// import 'counter_event.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Provider<CounterBloc>(
//           create: (context) => CounterBloc(),
//           child: const MyHomePage(title: 'Flutter Demo Home Page')),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late CounterBloc counterBloc;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     counterBloc = Provider.of<CounterBloc>(context);
//   }

//   void _incrementCounter() {
//     counterBloc.eventSink.add(IncrementCounterEvent());
//   }

//   void _decrementCounter() {
//     counterBloc.eventSink.add(DecrementCounterEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: StreamBuilder(
//           stream: counterBloc.stateStream,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return CounterWidget(state: snapshot.data!);
//             } else {
//               return const Center(
//                 child: Text('Initial Data'),
//               );
//             }
//           },
//         ),
//         floatingActionButton: ButtonBar(
//           children: [
//             FloatingActionButton(
//               onPressed: _incrementCounter,
//               tooltip: 'Increment',
//               child: const Icon(Icons.add),
//             ),
//             FloatingActionButton(
//               onPressed: _decrementCounter,
//               tooltip: 'Decrement',
//               child: const Icon(Icons.remove),
//             ),
//           ],
//         ));
//   }
// }

// class CounterWidget extends StatelessWidget {
//   const CounterWidget({super.key, required this.state});
//   final CounterState state;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text('You have counter value'),
//         Text('${state.counter}')
//       ],
//     ));
//   }
// }
