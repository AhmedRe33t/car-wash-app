import 'package:carwashing/app/car_wash_app.dart';
import 'package:carwashing/core/database/cache/cache_helper.dart';
import 'package:carwashing/core/functions/check_state_changes.dart';
import 'package:carwashing/core/services/service_locator.dart';
import 'package:carwashing/core/utils/app_string.dart';
import 'package:carwashing/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
    Stripe.publishableKey = DataString.publishableKey;
 
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
 

 checkStateChanges();
  runApp(const CarWash());
}

 