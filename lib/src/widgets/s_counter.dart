// ignore_for_file: library_private_types_in_public_api

/*
* File : SuperKit Counter Widget
* Version : 1.0.0
* */
import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitCounterView extends StatefulWidget {
  final int? initNumber;
  final Function(int)? counterCallback;
  final Function? increaseCallback;
  final Function? decreaseCallback;
  final int? minNumber;
  final double? radius;

  const SuperKitCounterView({
    Key? key,
    this.initNumber,
    this.counterCallback,
    this.increaseCallback,
    this.decreaseCallback,
    this.minNumber,
    this.radius = 12,
  }) : super(key: key);

  @override
  _SuperKitCounterViewState createState() => _SuperKitCounterViewState();
}

class _SuperKitCounterViewState extends State<SuperKitCounterView> {
  late int _currentCount;
  Function? _counterCallback;
  Function? _increaseCallback;
  Function? _decreaseCallback;
  int? minNumber;

  @override
  void initState() {
    _currentCount = widget.initNumber ?? 1;
    _counterCallback = widget.counterCallback ?? (int number) {};
    _increaseCallback = widget.increaseCallback ?? () {};
    _decreaseCallback = widget.decreaseCallback ?? () {};
    minNumber = widget.minNumber ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return Container(
      padding: EdgeInsets.zero,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius!),
        color: colorChanger(
          context: context,
          dark: kcNeutralColor_80,
          light: kcNeutralColor_10,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _createIncrementDicrementButton(Icons.remove, () => _dicrement()),
          SuperKitText.bodyBold(text: _currentCount.toString(), lang: lang),
          _createIncrementDicrementButton(Icons.add, () => _increment()),
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      _currentCount++;
      _counterCallback!(_currentCount);
      _increaseCallback!();
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > minNumber!) {
        _currentCount--;
        _counterCallback!(_currentCount);
        _decreaseCallback!();
      }
    });
  }

  Widget _createIncrementDicrementButton(IconData? icon, Function? onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: const BoxConstraints(minWidth: 32.0, minHeight: 50.0),
      onPressed: () {
        onPressed!();
      },
      fillColor: colorChanger(
        context: context,
        dark: kcNeutralColor_80,
        light: kcNeutralColor_10,
      ),
      elevation: 0,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: icon == Icons.remove
            ? BorderRadius.only(
                topLeft: Radius.circular(widget.radius!),
                bottomLeft: Radius.circular(widget.radius!),
              )
            : BorderRadius.only(
                topRight: Radius.circular(widget.radius!),
                bottomRight: Radius.circular(widget.radius!),
              ),
      ),
      child: Icon(
        icon!,
        size: 16.0,
      ),
    );
  }
}
