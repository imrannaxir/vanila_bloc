import 'package:flutter/material.dart';

@immutable
//  immutable, meaning that their values cannot be changed once they are assigned.
class CounterState {
  final int counter;
  const CounterState({required this.counter});
}
