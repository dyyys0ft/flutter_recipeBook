import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 255, 68, 124),
                          ),
                        ),

                        child: ClipRRect(
                          child: Image.network(
                            'https://theonlinefoodpantry.org/wp-content/uploads/2023/11/LogoForYoast.jpg',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "55555555",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 255, 68, 124),
                          ),
                        ),
                        child: Center(child: Text("IMAGE")),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "55555555",
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
