import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';

import 'core/services/service_locator/service_locator.dart';
import 'core/utils/extenstions/navigation_extenstions.dart';
import 'core/utils/theme/app_theme/app_theme.dart';
import 'features/chats/presentation/viewmodel/chats_cubit.dart';
import 'observers/route_observer.dart';

class NeroTumApp extends StatefulWidget {
  const NeroTumApp({super.key});

  @override
  State<NeroTumApp> createState() => _NeroTumAppState();
}

class _NeroTumAppState extends State<NeroTumApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      routeObserver
          .setInitialRoute(ModalRoute.of(context)?.settings.name ?? '');
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<ChatsCubit>(
          create: (_) => getIt<ChatsCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationExtensions.navigatorKey,
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: appTheme,
        navigatorObservers: [routeObserver],
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).size.width > 600
                ? MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(0.78))
                : MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(0.96)),
            child: child!,
          );
        },
      ),
    );
  }
}
