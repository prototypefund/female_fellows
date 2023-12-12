import 'package:flutter/material.dart';
import 'package:vs_femalefellows/pages/Eventpages/EventOverview/event_overview.dart';
import 'package:vs_femalefellows/pages/Homepage/homepage_container/carousel_items.dart';

class EventCarousel extends StatelessWidget {
  const EventCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 300,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, ),
              child: Text(
                'Schau bei unseren Events vorbei',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 5,
              endIndent: 320,
              indent: 15,
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 150,
              width: 1000,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CarousItem(),
                  CarousItem(),
                  CarousItem(),
                  CarousItem(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>EventOverview() ),);
                },
                child: Text(
                  'Zu allen Events',
                  style: TextStyle(
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
