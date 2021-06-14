import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home/job_entries/format.dart';
import 'package:time_tracker_flutter_course/app/home/models/entry.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';

class EntryListItemModel {
  EntryListItemModel(this.context, {required this.entry, required this.job});

  final BuildContext context;
  final Entry entry;
  final Job job;

  String get dayOfWeek => Format.dayOfWeek(entry.start);
  String get startDate => Format.date(entry.start);
  String get startTime => TimeOfDay.fromDateTime(entry.start).format(context);
  String get endTime => TimeOfDay.fromDateTime(entry.end).format(context);
  String get durationFormatted => Format.hours(entry.durationInHours);

  double get pay => job.ratePerHour * entry.durationInHours;
  String get payFormatted => Format.currency(pay);
}
