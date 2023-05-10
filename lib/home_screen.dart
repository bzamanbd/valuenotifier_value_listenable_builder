import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ValueNotifier<int> _currentNum = ValueNotifier<int>(0);
  final ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    dev.log('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: _isObscure,
                builder: (_, data, child) {
                  return TextField(
                    decoration: InputDecoration(
                      labelText: 'password',
                      suffix: IconButton(
                        onPressed: () => _isObscure.value = !_isObscure.value,
                        icon: _isObscure.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                    obscureText: _isObscure.value,
                  );
                }),
            ValueListenableBuilder(
                valueListenable: _currentNum,
                builder: (_, data, child) {
                  dev.log('only build this widget');
                  return Text(
                    _currentNum.value.toString(),
                    textScaleFactor: 4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _currentNum.value++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
