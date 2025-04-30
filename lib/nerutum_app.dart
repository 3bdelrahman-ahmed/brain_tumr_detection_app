import 'package:brain_tumr_detection_app/core/components/cubits/app_cubit/app_cubit.dart';
import 'package:brain_tumr_detection_app/features/profle/presentation/viewmodel/settings_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/services/service_locator/service_locator.dart';
import 'core/utils/extenstions/navigation_extenstions.dart';
import 'core/utils/theme/app_theme/app_theme.dart';
import 'features/chats/presentation/view_model/chats_cubit.dart';
import 'generated/l10n.dart';
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
        providers: [
          BlocProvider<ChatsCubit>(
            create: (_) => getIt<ChatsCubit>(),
          ),
          BlocProvider<AppCubit>(
            create: (_) => getIt<AppCubit>(),
          ),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final appCubit = context.read<AppCubit>();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: NavigationExtensions.navigatorKey,
              initialRoute: AppRoutes.splashScreen,
              onGenerateRoute: AppRouter.onGenerateRoute,
              theme: appTheme,
              navigatorObservers: [routeObserver],
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              locale:
                  appCubit.isEnglish ? const Locale('en') : const Locale('ar'),
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
            );
          },
        ));
  }
}
