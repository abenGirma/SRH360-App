class Article {
  final String category;
  final String title;
  final String description;
  final String imageUrl;
  final int minute;
  final String content;
  final String name;
  final String bio;
  final String articleName;

  Article({
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.minute,
    required this.content,
    required this.name,
    required this.bio,
    required this.articleName,
  });
}


class Profile {
  final String imagegUrl;

  Profile({required this.imagegUrl});
}

Profile profilePic = Profile(
    imagegUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOuxrvcNMfGLh73uKP1QqYpKoCB0JLXiBMvA&s');
