class Arrangement {
  String name;
  String code;
  String startTime;
  String endTime;
  List<String> participants;

  Arrangement(
      this.name, this.code, this.startTime, this.endTime, this.participants);

  // named constructor
  Arrangement.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        code = json['code'],
        startTime = json['startTime'],
        endTime = json['endTime'],
        participants = json['participants'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'startTime': startTime,
      'endTime': endTime,
      'participants': participants
    };
  }
}
