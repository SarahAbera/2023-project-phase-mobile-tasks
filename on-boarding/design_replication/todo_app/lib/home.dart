import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/add_task.dart';

class CardData {
  final String title;
  final String inCircle;
  final String date;

  CardData({
    required this.title,
    required this.inCircle,
    required this.date,
  });
}

class TodoList extends StatelessWidget {
  // const TodoList({super.key});
  final List<CardData> cardDataList = [
    CardData(title: "UI/UX app design", inCircle: "U", date: "August 8,2023"),
    CardData(title: "Flutter layout", inCircle: "F", date: "August 8,2023"),
    CardData(
        title: "Navigation & routing", inCircle: "N", date: "August 8,2023")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
                size: 40, color: Color.fromRGBO(36, 47, 101, 1)),
          ),
          title: const Center(
            child: Text(
              "Todo List",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromRGBO(36, 47, 101, 1),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                size: 40,
                color: Color.fromRGBO(36, 47, 101, 1),
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                  child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("image_assets/todo man.png"),
              )),
              Text(
                "Tasks list",
                style: GoogleFonts.justMeAgainDownHere(
                    color: const Color.fromRGBO(36, 47, 101, 1),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
              Expanded(
                child: ListView(
                  children: cardDataList.map((cardData) {
                    return MyCard(cardData: cardData);
                  }).toList(),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddTask()));
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: const Text(
                      "Create task",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ))
                ),
              )
            ])));
  }
}

class MyCard extends StatelessWidget {
  final CardData cardData;
  const MyCard({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 400,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: 40, // Add width constraint
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                      child: Text(
                    cardData.inCircle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
                ]),
              ),
              Positioned(
                left: 60,
                top: 3,
                // Add right constraint
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardData.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 2,
                child: Text(
                  cardData.date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const Positioned(
                  right: 1,
                  child: SizedBox(
                    height: 80,
                    width: 10,
                    child: VerticalDivider(
                      thickness: 2,
                      indent: 3,
                      color: Color.fromARGB(255, 8, 14, 100),
                    ),
                  )),
              const SizedBox(height: 8)
            ],
          ),
        ),
      ),
    );
  }
}
