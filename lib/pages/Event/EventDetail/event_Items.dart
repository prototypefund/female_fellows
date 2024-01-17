import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/pages/Event/EventComponents/participants_image_row.dart';

class EventItems extends StatelessWidget {
  const EventItems({super.key, required this.eventState});

  final Event eventState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              '${eventState.date.toDate().day}.${eventState.date.toDate().month}.${eventState.date.toDate().year}',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              'Datum des Events',
              style: TextStyle(fontSize: 12),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              eventState.host,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              'Veranstalter',
              style: TextStyle(fontSize: 12),
            ),
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticatedUser) {
                return ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text(
                    '${eventState.location.street},${eventState.location.city}',
                    style: TextStyle(fontSize: 15),
                  ),
                  subtitle: Text(
                    'Adresse des Events',
                    style: TextStyle(fontSize: 12),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          ListTile(
            leading: Image.asset(
              'lib/images/ImageIcon.png',
              cacheHeight: 25,
            ),
            title: Text(
              eventState.contactPerson,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              'Ansprechpartnerin',
              style: TextStyle(fontSize: 12),
            ),
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticatedUser &&
                  state.userProfile!.participatingEvents
                      .contains(eventState.id)) {
                return GestureDetector(
                  onTap: () => launchUrl(Uri.parse(eventState.whatsAppLink)),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'lib/images/chat.svg',
                      height: 20,
                    ),
                    title: Text(
                      eventState.whatsAppLink,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      'WhatsApp Gruppenlink',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          ParticipantsImageRow(),
        ],
      ),
    );
  }
}
