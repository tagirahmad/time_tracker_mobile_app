class Job {
  Job({required this.id, required this.name, required this.ratePerHour});

  final String id;
  final String name;
  final int ratePerHour;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ratePerHour': ratePerHour,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map, String documentId) {
    print(map['ratePerHour'].runtimeType);
    return Job(
      id: documentId,
      name: map['name'],
      ratePerHour: map['ratePerHour'],
    );
  }
}
