import 'package:flutter/material.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EventDescription extends StatelessWidget {
  const EventDescription({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.eventOneTitleOne,
            style: TextStyle(fontSize: 20),
          ),
          Divider(
            thickness: 5,
            endIndent: 320,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 150,
            width: 350,
            child: Text(
              event.description,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
