import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vs_femalefellows/models/events.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateMaterials extends StatefulWidget {
  const UpdateMaterials({super.key, required this.event});

  final Event event;

  @override
  State<UpdateMaterials> createState() => _UpdateMaterialsState();
}

class _UpdateMaterialsState extends State<UpdateMaterials> {
  @override
  void initState() {
    _setInputFields(widget.event);
    super.initState();
  }

  void _setInputFields(Event eventState) {
    Controller.planerController.text = eventState.material!.planer;
    Controller.foodController.text = eventState.material!.food;
    Controller.clothesController.text = eventState.material!.clothes;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.createEventsMaterialTitle,
            style: TextStyle(fontSize: 20),
          ),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 5,
            endIndent: 320,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            isThreeLine: true,
            leading: SvgPicture.asset(
              'lib/images/notebook.svg',
            ),
            title: Text(AppLocalizations.of(context)!.eventOneSubtitleOne),
            subtitle: TextField(
              controller: Controller.planerController,
              decoration: InputDecoration(
                  hintText: widget.event.material?.planer ??
                      AppLocalizations.of(context)!.createEventsMaterial),
            ),
          ),
          ListTile(
            isThreeLine: true,
            leading: SvgPicture.asset(
              'lib/images/food.svg',
            ),
            title: Text(AppLocalizations.of(context)!.eventOneSubtitleTwo),
            subtitle: TextField(
              controller: Controller.foodController,
              decoration: InputDecoration(
                  hintText: widget.event.material?.food ??
                      AppLocalizations.of(context)!.createEventsMaterial),
            ),
          ),
          ListTile(
            isThreeLine: true,
            leading: Image.asset(
              'lib/images/Shirt.png',
              cacheHeight: 35,
            ),
            title: Text(AppLocalizations.of(context)!.eventOneSubtitleThree),
            subtitle: TextField(
              controller: Controller.clothesController,
              decoration: InputDecoration(
                  hintText: widget.event.material?.clothes ??
                      AppLocalizations.of(context)!.createEventsMaterial),
            ),
          ),
          ListTile(
            isThreeLine: true,
            leading: Image.asset(
              'lib/images/Star.png',
              cacheHeight: 35,
            ),
            title: Text(AppLocalizations.of(context)!.eventOneSubtitleFour),
            subtitle: TextField(
                controller: Controller.informationController,
                decoration: InputDecoration(
                    hintText: widget.event.material?.information ??
                        AppLocalizations.of(context)!.createEventsMaterial)),
          ),
        ],
      ),
    );
  }
}
