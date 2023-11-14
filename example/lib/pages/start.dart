import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final items = List.generate(1000, (index) => '$index');
  var filterOptions = List.of(IntType.values);
  @override
  Widget build(BuildContext context) {
    return SimpleSPageTemplate(
        title: "Earning",
        centerTitle: false,
        appbarColor: Colors.white,
        elevation: 0,
        // bottomWidget: buildAppBarBottom(),
        // selectedTextStyle: TextStyle(color: Colors.red),
        // unSelectedTextStyle: TextStyle(color: Colors.green),
        // titleColor: Colors.white,
        enableBack: true,
        hasTrailing: true,
        listOptions: [
          MoreMenu(1, "share"),
          MoreMenu(2, "share"),
          MoreMenu(3, "share"),
        ],
        onSelectOption: (value) {
          debugPrint(value!.name.toString());
        },
        body: buildBody());
  }

  Widget buildBody() {
    return Scrollbar(
      // second question
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          if (filterOptions.any((option) => option.length == item.length)) {
            return ListTile(title: Text(item));
          }

          return Container(height: 0.0001); // first question
        },
      ),
    );
  }

  PreferredSizeWidget buildAppBarBottom() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: IntType.values.map((option) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: FilterChip(
                selectedColor: Colors.white,
                selected: filterOptions.contains(option),
                onSelected: (isSelected) {
                  setState(() {
                    if (isSelected) {
                      filterOptions.add(option);
                    } else {
                      filterOptions.remove(option);
                    }
                  });
                },
                label: Text(option.name),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class IntType {
  static const IntType ones = const IntType._('Ones', 1);
  static const IntType tens = const IntType._('Tens', 2);
  static const IntType hundreds = const IntType._('Hundreds', 3);

  final String name;
  final int length;

  const IntType._(this.name, this.length);

  static const values = [
    IntType.ones,
    IntType.tens,
    IntType.hundreds,
  ];
}
