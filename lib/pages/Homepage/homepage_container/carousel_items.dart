import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  CarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color:  Theme.of(context).colorScheme.secondary,
        ),
        height: 160,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  '',
                  style: TextStyle(fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
              Image(
                image: AssetImage('lib/images/partner1.png'),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
