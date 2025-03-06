import 'package:flutter/material.dart';

class Test {
  final String name;

  const Test({required this.name});

  Test copyWith({String? name}) {
    return Test(name: name ?? this.name);
  }
}

/// Value Notifier
/// Use for single value immmutable data type
///
/// Should not be used for list or map
class TestingValueNotifier extends ValueNotifier<Test> {
  TestingValueNotifier(super.state);

  void changeName(String name) {
    value = value.copyWith(name: name);
  }
}

class TestingDefaultValueNotifier extends ValueNotifier<Test> {
  TestingDefaultValueNotifier() : super(Test(name: 'name'));

  void changeName(String name) {
    value = value.copyWith(name: name);
  }
}

/// Change Notifier
class TestingChangeNotifier extends ChangeNotifier {
  TestingChangeNotifier({required this.test});

  final Test test;

  void updateValue(String name) {
    final update = test.copyWith(name: name);
    notifyListeners();
  }
}

/// Inherited Widget

class TestingInheritedWidget extends InheritedWidget {
  const TestingInheritedWidget({
    super.key,
    required super.child,
    required this.data,
  });

  final Test data;

  @override
  bool updateShouldNotify(TestingInheritedWidget oldWidget) {
    return data != oldWidget.data;
  }
}

/// Inherited Notifier

class TestingInheritedNotifier
    extends InheritedNotifier<TestingChangeNotifier> {
  const TestingInheritedNotifier({
    super.key,
    required super.child,
    required TestingChangeNotifier testingnotifier,
  }) : super(notifier: testingnotifier);
}

void main() {
  final ad = TestingValueNotifier(Test(name: 'Work'));
}
