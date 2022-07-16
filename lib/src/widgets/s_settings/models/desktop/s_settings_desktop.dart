import 'package:flutter/material.dart';

class SettingsDesktopDrawer extends StatefulWidget {
  const SettingsDesktopDrawer({Key? key}) : super(key: key);

  @override
  State<SettingsDesktopDrawer> createState() => _SettingsDesktopDrawerState();
}

class _SettingsDesktopDrawerState extends State<SettingsDesktopDrawer> {
  static const double _offset = 30;
  double _drawerLeft = 400;
  IconData _drawerIcon = Icons.arrow_back_ios;
  bool _init = true;

  @override
  Widget build(BuildContext context) {
    if (_init) {
      _drawerLeft = MediaQuery.of(context).size.width - _offset;
      _init = false;
    }
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.5,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Opacity(
            opacity:
                1 - _drawerLeft / (MediaQuery.of(context).size.width - _offset),
            child:
                const ModalBarrier(dismissible: false, color: Colors.black87),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 3 / 4,
            top: 0,
            height: MediaQuery.of(context).size.height / 2,
            left: _drawerLeft,
            child: GestureDetector(
                onPanUpdate: (details) {
                  _drawerLeft += details.delta.dx;
                  if (_drawerLeft <= MediaQuery.of(context).size.width / 4) {
                    _drawerLeft = MediaQuery.of(context).size.width / 4;
                  }
                  if (_drawerLeft >=
                      MediaQuery.of(context).size.width - _offset) {
                    _drawerLeft = MediaQuery.of(context).size.width - _offset;
                  }
                  if (_drawerLeft <= MediaQuery.of(context).size.width / 3) {
                    _drawerIcon = Icons.arrow_forward_ios;
                  }
                  if (_drawerLeft >=
                      MediaQuery.of(context).size.width - 2 * _offset) {
                    _drawerIcon = Icons.arrow_back_ios;
                  }
                  setState(() {});
                },
                child: Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: _offset),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              _drawerIcon,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'text',
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
