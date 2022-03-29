class Question {
  final int id;
  final String title;
  final String v;
  final String rep;

  const Question({
    required this.id,
    required this.title,
    required this.v,
    required this.rep,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'],
        title: json['title'],
        v: json['v'],
        rep: json['rep'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'v': v,
        'rep': rep,
      };
}
