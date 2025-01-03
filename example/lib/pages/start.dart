import 'dart:io';

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
  // final items = List.generate(1000, (index) => '$index');
  // var filterOptions = List.of(IntType.values);
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
        title: "Profile",
        centerTitle: false,
        font: "Rubik",
        pinned: true,
        appBarHeight: 55,
        statuBarBrightness: (Platform.isIOS)
            ? (isDarkMode(context) ? Brightness.dark : Brightness.light)
            : (isDarkMode(context) ? Brightness.light : Brightness.dark),
        elevation: isDarkMode(context) ? null : 0,
        appbarColor: colorChanger(
          context: context,
          dark: Colors.black,
          light: Colors.white,
        ),
        titleColor: colorChanger(
          context: context,
          dark: Colors.black,
          light: Colors.white,
        ),
        enableTabs: true,
        tabs: [
          Tab(
            text: "Tab 1",
          ),
          Tab(
            text: "Tab 2",
          ),
          Tab(
            text: "Tab 3",
          ),
        ],
        tabsWidgets: [
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SuperKitButton.large(
                    title: "Show Alert",
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    font: "Rubik",
                    isTimerActive: false,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Confirmation"),
                            content: Column(
                              children: [
                                Text("Are you sure you want to proceed?"),
                                SuperKitButton.large(
                                  title: "Click Me",
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  font: "Rubik",
                                  isTimerActive: true,
                                  disabledTimer: 5,
                                  borderRadius: 100,
                                  onTap: () {},
                                ),
                                SuperKitButton.large(
                                  title: "Cancel",
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  font: "Rubik",
                                  isTimerActive: false,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text("Tab 2"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Tab 3"),
            ),
          ),
        ],
        // onTabChange: (index) {
        //   debugPrint(index.toString());
        // },
        trailing: IconButton(
          onPressed: () {
            superkitSettingsMobile(
              context: context,
              languagePr: appLanguage,
              languages: globalProvider!.config!.languages,
              // themePr: themeProvider,
              supportedThemes: globals.supportedThemes,
              enableDrawer: false,
              enbalethemes: false,
              darkColor: Colors.black,
              lightColor: Colors.white,
              enableNotificationSection: true,
              enableAccountOverview: true,
              accountOverviewValue: true,
              onAccountOverviewChange: (account) => debugPrint(
                account.toString(),
              ),
              notificationValue: false,
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
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SuperKitInput(
                  controller: controller,
                  borderSide: BorderSide.none,
                  maxLines: 1,
                  placeholder: "ex: John Doe",
                  onChanged: (val) {
                    debugPrint(val.toString());
                  },
                ),
                verticalSpaceRegular,
                SuperKitButton.outline(
                  title: "Submit",
                  width: screenWidth(context) / 2,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  onTap: () {
                    debugPrint(controller.text);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  // Widget buildBody() {
  //   return Scrollbar(
  //     // second question
  //     child: ListView.builder(
  //       itemCount: items.length,
  //       itemBuilder: (context, index) {
  //         final item = items[index];

  //         if (filterOptions.any((option) => option.length == item.length)) {
  //           return ListTile(title: Text(item));
  //         }

  //         return Container(height: 0.0001); // first question
  //       },
  //     ),
  //   );
  // }

  // PreferredSizeWidget buildAppBarBottom() {
  //   return PreferredSize(
  //     preferredSize: Size.fromHeight(50),
  //     child: Padding(
  //       padding: EdgeInsets.all(8),
  //       child: Row(
  //         children: IntType.values.map((option) {
  //           return Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 4),
  //             child: FilterChip(
  //               selectedColor: Colors.white,
  //               selected: filterOptions.contains(option),
  //               onSelected: (isSelected) {
  //                 setState(() {
  //                   if (isSelected) {
  //                     filterOptions.add(option);
  //                   } else {
  //                     filterOptions.remove(option);
  //                   }
  //                 });
  //               },
  //               label: Text(option.name),
  //             ),
  //           );
  //         }).toList(),
  //       ),
  //     ),
  //   );
  // }
}

// class IntType {
//   static const IntType ones = const IntType._('Ones', 1);
//   static const IntType tens = const IntType._('Tens', 2);
//   static const IntType hundreds = const IntType._('Hundreds', 3);

//   final String name;
//   final int length;

//   const IntType._(this.name, this.length);

//   static const values = [
//     IntType.ones,
//     IntType.tens,
//     IntType.hundreds,
//   ];
// }
