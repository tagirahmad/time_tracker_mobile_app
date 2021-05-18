import 'package:time_tracker_flutter_course/app/home/models/job.dart';
import 'package:time_tracker_flutter_course/services/api_path.dart';
import 'package:time_tracker_flutter_course/services/firestore_service.dart';

abstract class Database {
  Future<void> createJob(Job job);
  Stream<List<Job>> jobsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<void> createJob(Job job) => _service.setData(
        data: job.toMap(),
        path: APIPath.job(uid, 'job_abc'),
      );

  @override
  Stream<List<Job>> jobsStream() => _service.collectionStream<Job>(
        path: APIPath.jobs(uid),
        builder: (data) => Job.fromMap(data),
      );
}
