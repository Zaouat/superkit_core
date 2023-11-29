import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';
import 'package:superkit_project/providers/global_provider.dart';
import 'package:superkit_project/providers/local_provider.dart';
import 'package:superkit_project/providers/theme_provider.dart';
import 'package:superkit_project/config/globals.dart' as globals;

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final items = List.generate(1000, (index) => '$index');
  var filterOptions = List.of(IntType.values);
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer3<LocaleProvider, GlobalProvider, ThemeProvider>(builder: (
      BuildContext context,
      LocaleProvider? appLanguage,
      GlobalProvider? globalProvider,
      ThemeProvider? themeProvider,
      Widget? child,
    ) {
      return SimpleSPageTemplate(
          title: "Earning",
          titleColor: Colors.white,
          centerTitle: false,
          appbarColor: Colors.green,
          elevation: 0,
          tabs: [
            SuperKitText.bodyBold(
              text: "home",
              lang: globals.lang,
            ),
            SuperKitText.bodyBold(
              text: "Settings",
              lang: globals.lang,
            ),
          ],
          selectedTextStyle: TextStyle(
            color: Colors.white,
          ),
          unSelectedTextStyle: TextStyle(
            color: Colors.white.withOpacity(.5),
          ),
          indicatorColor: Colors.red,
          indicator: Indicator.material,
          enableTabs: true,
          tabsWidgets: [Container(), Container()],
          trailing: IconButton(
            onPressed: () {
              superkitSettingsMobile(
                context: context,
                languagePr: appLanguage,
                globalPr: globalProvider,
                themePr: themeProvider,
                supportedThemes: globals.supportedThemes,
                enableDrawer: false,
                enbalethemes: false,
                darkColor: Colors.black,
                lightColor: Colors.white,
                enableNotification: true,
                onChange: (notification) => debugPrint(
                  notification.toString(),
                ),
              );
            },
            padding: EdgeInsets.only(right: screenWidth(context) * 0.1),
            tooltip: 'Settings',
            icon: Icon(
              Icons.settings,
              size: 28,
              color: Colors.black,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SuperKitInput(
                  controller: controller,
                  onChanged: (val) {
                    debugPrint(val.toString());
                  },
                ),
              ],
            ),
          ));
    });
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
