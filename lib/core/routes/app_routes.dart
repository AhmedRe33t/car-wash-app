import 'package:carwashing/features/auth/auth_cubit/cubit/auth_cubit.dart';
import 'package:carwashing/features/auth/view/forget_password_view.dart';
import 'package:carwashing/features/auth/view/sign_in_view.dart';
import 'package:carwashing/features/auth/view/sign_up_view.dart';
import 'package:carwashing/features/car_types/cubit/cubit/before_start_page_cubit.dart';
import 'package:carwashing/features/car_types/presentation-2/views/Before_Start.dart';
import 'package:carwashing/features/home/presentation/widgets/home_nav_bar.dart';
import 'package:carwashing/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_cubit.dart';
import 'package:carwashing/features/splash/presentation/view/splash_view.dart';
import 'package:carwashing/features/standered_wash/presentation/cubit/Maps%20cubit/google_maps_cubit.dart';
import 'package:carwashing/features/standered_wash/presentation/cubit/date_time_cubit.dart';
import 'package:carwashing/features/standered_wash/presentation/view/date_time.dart';
import 'package:carwashing/features/standered_wash/presentation/view/getLocation.dart';
import 'package:carwashing/features/standered_wash/presentation/view/over_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SplashView()),
  GoRoute(
      path: '/signInView',
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignInView(),
          )),
  GoRoute(
      path: '/dateTimeView',
      builder: (context, state) => BlocProvider(
            create: (context) => DateTimeCubit(),
            child: const DateTimeView(),
          )),
  GoRoute(
      path: '/overView',
      builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => DateTimeCubit()..getDateAndTime(),
              ),
              BlocProvider(
                create: (context) => ProfileCubit()..getUserDtat(),
              ),
               BlocProvider(
                create: (context) => ServiceCubit()..getFinalPrices(),
              ),
            ],
            child: const OverView(),
          )),
  GoRoute(
      path: '/forgotPassword',
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const ForgetPasswordView(),
          )),
  GoRoute(
      path: '/signUpView',
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignUpView(),
          )),
  GoRoute(
      path: '/homeNavBar',
      builder: (context, state) => const HomeNavBarWidget()),
  GoRoute(
      path: '/mapsView',
      builder: (context, state) => BlocProvider(
          create: (context) => GoogleMapsCubit(), 
          child: const Getlocation())),
  GoRoute(
      path: '/beforeStartBody',
      builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CarTypesCubit()..getCarTypes(),
              ),
               BlocProvider(
                create: (context) => ServiceCubit(),
              ),
            ],
            child: const Before_Start(),
          )),
]);
