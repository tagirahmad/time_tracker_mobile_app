class Job {
  Job({required this.name, required this.ratePerHour});

  final String name;
  final String ratePerHour;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ratePerHour': ratePerHour,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      name: map['name'],
      ratePerHour: map['ratePerHour'],
    );
  }
}
