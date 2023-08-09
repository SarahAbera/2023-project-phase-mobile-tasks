import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 40,
            color: Color.fromRGBO(36, 47, 101, 1),
          ),
        ),
        title: const Center(child: Text("")),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert,
                size: 40, color: Color.fromRGBO(36, 47, 101, 1)),
            onPressed: () {},
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        leadingWidth: 80,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create new task",
                style: GoogleFonts.justMeAgainDownHere(
                  fontSize: 40, // Adjust font size
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(36, 47, 101, 1),
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Color.fromRGBO(36, 47, 101, 1),
                height: 25,
                thickness: 1,
              ),
              const SizedBox(height: 16),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Main task name",
                    style: TextStyle(
                      color: Color(0xFF3FAEE5),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Form(
                    child: Column(children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(color: Color(0xFF3FAEE5)),
                        hintText: "Give title for your task",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.4))),
                  ),
                ])),
                const SizedBox(height: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Due date",
                      style: TextStyle(
                        color: Color(0xFF3FAEE5),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Form(
                      child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(color: Color(0xFF3FAEE5)),
                        hintText: "Write date",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.4)),
                        suffixIcon: const Icon(Icons.date_range),
                      ),
                    ),
                  ])),
                  const SizedBox(height: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              color: Color(0xFF3FAEE5),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Form(
                            child: Column(children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelStyle:
                                    const TextStyle(color: Color(0xFF3FAEE5)),
                                hintText: "Your task's description",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.4))),
                          ),
                        ])),
                      ])
                ]),
              ]),
          const SizedBox(height: 40),
          SizedBox(
          width: 250,
          height: 75,
          child:ElevatedButton(
          onPressed:(){}, 
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3FAEE5),
            foregroundColor : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            )
            ),
    
          child: const Text(
            "Add task",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold 
            ),
          ),
          ) ,
        )
            ]),

            
      ),
    );
  }
}