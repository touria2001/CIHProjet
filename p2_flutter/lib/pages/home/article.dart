class Article {
  Article({required this.titre, required this.date,required this.image });

  Article.fromJson(Map<String, Object?> json)
    : this(
        titre: json['titre']! as String,
        date: json['date']! as String,
        image: json['image']! as String,
      );

   String titre;
   String date;
   String image;

  Map<String, Object?> toJson() {
    return {
      'titre': titre,
      'date': date,
      'image': image,
    };
  }
}