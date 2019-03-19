class Recipe {
  int id;
  String title;
  String image;
  String imageType;
  int usedIngredientCount;
  int missedIngredientCount;
  int likes;

  Recipe(
      {this.id,
      this.title,
      this.image,
      this.usedIngredientCount,
      this.missedIngredientCount,
      this.likes});

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        image = json['image'],
        usedIngredientCount = json['usedIngredientCount'],
        missedIngredientCount = json['missedIngredientCount'],
        likes = json['likes'];
}
