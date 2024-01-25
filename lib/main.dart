import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/blocs/CategoriesCubit/categories_cubit.dart';
import 'package:vs_femalefellows/blocs/EventBloc/event_bloc.dart';
import 'package:vs_femalefellows/blocs/FavoritesBloc/favorites_bloc.dart';
import 'package:vs_femalefellows/blocs/OnboardingBloc/onboarding_bloc.dart';
import 'package:vs_femalefellows/pages/ToolBarNavigation/navigation_page.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_start.dart';
import 'package:vs_femalefellows/provider/firestore/authrepository.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event_repository.dart';

import 'provider/firebase_options.dart';

final AuthRepository authenticationRepository = AuthRepository();
final FirestoreEventRepository firestoreEventRepository =
    FirestoreEventRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(
              authenticationRepository: authenticationRepository),
          lazy: false,
        ),
        BlocProvider(
            create: (BuildContext context) =>
                EventBloc(firestoreEventRepository)),
        BlocProvider<FavoritesBloc>(
          create: (BuildContext context) =>
              FavoritesBloc(BlocProvider.of<AuthenticationBloc>(context)),
          lazy: false,
        ),
        BlocProvider<FavoriteEventStore>(
          lazy: false,
          create: (BuildContext context) =>
              FavoriteEventStore(BlocProvider.of<AuthenticationBloc>(context)),
        ),
        BlocProvider<SubscribedEventsStore>(
          lazy: false,
          create: (BuildContext context) => SubscribedEventsStore(
              BlocProvider.of<AuthenticationBloc>(context)),
        ),
        BlocProvider<AllEventsStore>(
          create: (BuildContext context) => AllEventsStore(),
        ),
        BlocProvider<CategoryCubit>(
          lazy: false,
          create: (BuildContext context) => CategoryCubit(),
        ),
        BlocProvider<OnboardingBloc>(
          lazy: false,
          create: (BuildContext context) =>
              OnboardingBloc(BlocProvider.of<AuthenticationBloc>(context))
                ..add(CheckOnboardingEvent()),
        ),
        /* RepositoryProvider(
          create: (context) => AuthRepository(),
          child: LoginPage(),
        ) */
      ],
      child: MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('de'), // Deutsch
        ],
        theme: ThemeData(
          /* appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light
            )
          ), */
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(27, 25, 68, 1),
              primary: Color.fromRGBO(27, 25, 68, 1),
              secondary: Color.fromRGBO(252, 208, 220, 1),
              surface: Color.fromRGBO(242, 242, 242, 1),
              surfaceVariant: Color.fromRGBO(236, 240, 243, 1),
              tertiary: Color.fromRGBO(106, 104, 206, 1),
              onTertiary: Color.fromRGBO(241, 80, 60, 1)),
          textTheme: TextTheme(
            titleSmall: TextStyle(
              color: Color.fromRGBO(59, 57, 102, 1),
            ),
            titleLarge: TextStyle(
              color: Color.fromRGBO(59, 57, 102, 1),
            ),
            bodyLarge: TextStyle(
              color: Color.fromRGBO(59, 57, 102, 1),
            ),
          ),
          useMaterial3: true,
          fontFamily: 'Circular',
        ),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            if (state is IsOnboardingState) {
              return OnboardingPage();
            } else {
              return TabBarNavigation();
            }
          },
        ),
      ),
    );
  }
}
