import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/cartonn.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "About me",
                  style: TextStyle(
                      fontFamily: "balo", fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.check,
                      color: Colors.black38,
                    ),
                    Text(
                      "Telegram",
                      style: TextStyle(
                        fontFamily: "balo",
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.check,
                      color: Colors.black38,
                    ),
                    Text(
                      "Git Hub",
                      style: TextStyle(
                        fontFamily: "balo",
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.check,
                      color: Colors.black38,
                    ),
                    Text(
                      "Instagram",
                      style: TextStyle(
                        fontFamily: "balo",
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.045,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.amber.shade800,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  "Flutter",
                  style: TextStyle(
                    fontFamily: "balo",
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
