import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/events_carouselhomepage.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/homepage_divider.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_carousel.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_comments.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_faqs.dart';
import 'package:vs_femalefellows/pages/Tandem/tandem_header.dart';

class Tandementry extends StatelessWidget {
  const Tandementry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: ListView(
        children: [
          TandemHeader(),
          DividerBouthCorner(
              color1: Colors.white,
              color2: Theme.of(context).colorScheme.tertiary),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                SizedBox(
                  width: 350,
                  child: Text(
                    'Als Local oder Newcomerin beim Tandem-Projekt mitmachen',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Divider(
                  thickness: 3,
                  indent: 20,
                  endIndent: 310,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  child: Text(
                    'Das Female Fellows Tandemprojekt verbindet Frauen mit und ohne Flucht- und Migrationserfahrung. ',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              'Mehr erfahren',
              style: TextStyle(fontSize: 12, color: Colors.amber[900]),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              children: [
                Divider(
                  thickness: 3,
                  indent: 0,
                  endIndent: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Wie funktioniert´s',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: null,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 40,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 3,
                  indent: 0,
                  endIndent: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: null,
            child: Container(
              padding: EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                  child: Text(
                'Jetzt mit Tandem matchen',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )),
            ),
          ),
          DividerBouthCorner(
              color1: Theme.of(context).colorScheme.surface,
              color2: Colors.white),
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 350,
                    child: Text(
                      'Was kann man als Tandem gemeinsam unternehmen? ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    indent: 0,
                    endIndent: 310,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TandemCarousel(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          DividerBouthCorner(
              color1: Theme.of(context).colorScheme.tertiary,
              color2: Theme.of(context).colorScheme.surface),
          TandemComments(),
          DividerBouthCorner(
            color1: Colors.white,
            color2: Theme.of(context).colorScheme.tertiary,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tandem-Stories',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    indent: 0,
                    endIndent: 310,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TandemCarousel(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60))),
            height: 50,
          ),
          FAQs(),
        ],
      ),
    );
  }
}
