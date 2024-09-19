import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/features/auth/auth_cubit/cubit/auth_cubit.dart';
import 'package:carwashing/features/car_types/cubit/cubit/before_start_page_cubit.dart';
import 'package:carwashing/features/home/presentation/view/home_view.dart';
import 'package:carwashing/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:carwashing/features/profile/presentation/view/profile_view.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_cubit.dart';
import 'package:carwashing/features/services/presentation/view/service_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ServiceCubit()..getServicesTypes()),
        BlocProvider(create: (context) => ProfileCubit()..getUserDtat()),
      ],
      child: ServicesView(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit()..getUserDtat(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: const ProfileView(),
    ),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        inactiveColorPrimary: AppColors.greyColor,
        activeColorPrimary: AppColors.whiteColor),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.design_services),
        inactiveColorPrimary: AppColors.greyColor,
        activeColorPrimary: AppColors.whiteColor),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        inactiveColorPrimary: AppColors.greyColor,
        activeColorPrimary: AppColors.whiteColor),
  ];
}
