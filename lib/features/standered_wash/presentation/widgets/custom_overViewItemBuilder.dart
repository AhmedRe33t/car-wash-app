import 'package:carwashing/features/standered_wash/presentation/model/date_time_model.dart';
import 'package:flutter/material.dart';

class overViewItemBuilder extends StatelessWidget {
  const overViewItemBuilder({super.key, required this.model});
  final DateAndTime model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:const Icon(Icons.calendar_today) ,
      title:const Text('Date and Time :'),
      trailing: Text('${model.date} ${model.time}'),

    );
  }
}