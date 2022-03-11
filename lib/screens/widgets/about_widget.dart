import 'package:flutter/material.dart';
import 'package:qr_code_scanner/service/service_url.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "About me",
                  style: TextStyle(
                      fontFamily: "balo", fontWeight: FontWeight.bold),
                ),
                OutlinedButton(style: OutlinedButton.styleFrom(
                    fixedSize: const Size(100, 20),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: (() =>
                      ServiceUrl.launchURL("https://t.me/asadbek_blog1")),
                  child: const Text(
                    "Telegram",
                    style: TextStyle(
                      fontFamily: "balo",
                      color: Colors.black54,
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(100, 20),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: (() =>
                      ServiceUrl.launchURL("https://github.com/BekFlutterDev")),
                  child: const Text(
                    "Git Hub",
                    style: TextStyle(
                      fontFamily: "balo",
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
