import 'package:flutter/material.dart';

class CounterModel {
  CounterModel({required this.username, this.counter = 0});

  final String username;
  final int counter;

  CounterModel copyWith({final String? username, final int? counter}) {
    return CounterModel(
      username: username ?? this.username,
      counter: counter ?? this.counter,
    );
  }
}

class CounterNotifier extends ValueNotifier<CounterModel> {
  CounterNotifier(super.state);

  void increment() {
    value = value.copyWith(counter: value.counter + 1);
  }
}

class Provider<T extends Listenable> extends InheritedNotifier<T> {
  const Provider({super.key, required super.child, required super.notifier});

  static T of<T extends Listenable>(BuildContext context) {
    final Provider<T>? provider =
        context.dependOnInheritedWidgetOfExactType<Provider<T>>();

    if (provider == null) {
      throw Exception("No Provider found in context");
    }

    final notifier = provider.notifier;

    if (notifier == null) {
      throw Exception("No notifier found in Provider");
    }

    return notifier;
  }
}
