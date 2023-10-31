import 'package:flutter/material.dart';
typedef bool hasConfessed( bool newValue );

typedef void BoolCallback(bool id);

class AuthSafety extends StatefulWidget {
  AuthSafety({super.key, required this.hasConfessed, required this.onSettingsChanged});

  void Function( bool, bool)? hasConfessed;

  final BoolCallback onSettingsChanged;

  @override
  State<AuthSafety> createState() => _AuthSafetyState();
}

class _AuthSafetyState extends State<AuthSafety> {
  // Checkbox Radio
  bool _question = false;

  bool _question2 = false;

  bool _question3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'Datenschutzerlärung\nund Newsletter',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('lib/images/Anmelden.png'),
                  radius: 100,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CheckboxListTile(
                  dense: true,
                  title: Text(
                    'Ja, ich möchte den Newsletter abonnieren ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  value: _question,
                  onChanged: (newValue) {
                    setState(() {
                      _question = newValue ?? false;
                    
                      //widget.onSettingsChanged(_question);
                    });
                  }),
              CheckboxListTile(
                  dense: true,
                  title: Text(
                    'Ja, ich habe die Datenschutz-\nvereinbarungvon Female Fellows e.V. gelesen und stimme zu. ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  value: _question2,
                  onChanged: (newValue) {
                    setState(() {
                      _question2 = newValue ?? false;
                      widget.hasConfessed!( _question2, _question3);
                    });
                  }),
              CheckboxListTile(
                  dense: true,
                  title: Text(
                    'Ich habe den Verhaltenskodex von\nFemale Fellows gelesen und stimme zu. ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  value: _question3,
                  onChanged: (newValue) {
                    setState(() {
                      _question3 = newValue ?? false;
                      widget.hasConfessed!( _question2, _question3);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
