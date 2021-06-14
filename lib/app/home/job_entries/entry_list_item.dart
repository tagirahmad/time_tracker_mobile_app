import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home/job_entries/enty_list_item_model.dart';
import 'package:time_tracker_flutter_course/app/home/job_entries/format.dart';
import 'package:time_tracker_flutter_course/app/home/models/entry.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';

class EntryListItem extends StatelessWidget {
  const EntryListItem({
    required this.entry,
    required this.entryListItemModel,
    required this.job,
    required this.onTap,
  });

  final Entry entry;
  final EntryListItemModel entryListItemModel;
  final Job job;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: _buildContents(context),
            ),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    // final dayOfWeek = Format.dayOfWeek(entry.start);
    // final startDate = Format.date(entry.start);
    // final startTime = TimeOfDay.fromDateTime(entry.start).format(context);
    // final endTime = TimeOfDay.fromDateTime(entry.end).format(context);
    // final durationFormatted = Format.hours(entry.durationInHours);

    // final pay = job.ratePerHour * entry.durationInHours;
    // final payFormatted = Format.currency(pay);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(children: <Widget>[
          Text(entryListItemModel.dayOfWeek,
              style: TextStyle(fontSize: 18.0, color: Colors.grey)),
          SizedBox(width: 15.0),
          Text(entryListItemModel.startDate, style: TextStyle(fontSize: 18.0)),
          if (job.ratePerHour > 0.0) ...<Widget>[
            Expanded(child: Container()),
            Text(
              entryListItemModel.payFormatted,
              style: TextStyle(fontSize: 16.0, color: Colors.green[700]),
            ),
          ],
        ]),
        Row(children: <Widget>[
          Text(
              '${entryListItemModel.startTime} - ${entryListItemModel.endTime}',
              style: TextStyle(fontSize: 16.0)),
          Expanded(child: Container()),
          Text(entryListItemModel.durationFormatted,
              style: TextStyle(fontSize: 16.0)),
        ]),
        if (entry.comment.isNotEmpty)
          Text(
            entry.comment,
            style: TextStyle(fontSize: 12.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
      ],
    );
  }
}

class DismissibleEntryListItem extends StatelessWidget {
  const DismissibleEntryListItem({
    required this.key,
    required this.entry,
    required this.job,
    required this.onDismissed,
    required this.onTap,
  }) : super(key: key);

  @override
  final Key key;
  final Entry entry;
  final Job job;
  final VoidCallback onDismissed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: key,
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDismissed(),
      child: EntryListItem(
        entry: entry,
        job: job,
        onTap: onTap,
        entryListItemModel: EntryListItemModel(context, entry: entry, job: job),
      ),
    );
  }
}
