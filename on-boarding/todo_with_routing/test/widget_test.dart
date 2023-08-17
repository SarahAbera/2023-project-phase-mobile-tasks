import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// void main() {
//   // Define a test. The TestWidgets function also provides a WidgetTester
//   // to work with. The WidgetTester allows building and interacting
//   // with widgets in the test environment.
//   testWidgets('MyWidget has a title and message', (tester) async {
//     // Create the widget by telling the tester to build it.
//     await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

//     // Create the Finders.
//     final titleFinder = find.text('T');
//     final messageFinder = find.text('M');

//     // Use the `findsOneWidget` matcher provided by flutter_test to
//     // verify that the Text widgets appear exactly once in the widget tree.
//     expect(titleFinder, findsOneWidget);
//     expect(messageFinder, findsOneWidget);
//   });
// }

// class MyWidget extends StatelessWidget {
//   const MyWidget({
//     super.key,
//     required this.title,
//     required this.message,
//   });

//   final String title;
//   final String message;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: Center(
//           child: Text(message),
//         ),
//       ),
//     );
//   }
// }
void main() {
  runApp(WidgetTest());
}

class WidgetTest extends StatelessWidget {
  WidgetTest({super.key});
  final List<String> names = ["Sarah", "Ayele", "Daniel", "Lidya"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello flutter"),
          backgroundColor: Colors.amber,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: names.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                child: Column(children: [
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: Text("My name is ${names[index]}"),
                  ),
                ]),
              );
            }),
      ),
    );
  }
}
