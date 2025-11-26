// import 'package:flutter/material.dart';
// import 'package:flutter_overlay_window/flutter_overlay_window.dart';
//
// class PlayPauseWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Center(
//         child: Text(
//           'Hello, I am floating!',
//           style: TextStyle(color: Colors.white, fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
//
// class WidgetListScreen extends StatelessWidget {
//   final List<Widget> widgetList = List.generate(
//     10,
//         (index) => PlayPauseWidget(),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Widget List Example')),
//       body: ListView.builder(
//         itemCount: widgetList.length,
//         itemBuilder: (context, index) {
//           return widgetList[index];
//         },
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: WidgetListScreen(),
//   ));
// }
