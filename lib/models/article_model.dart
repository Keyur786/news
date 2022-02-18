class ArticleModel {
  
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String content;

  ArticleModel(
      {
      required this.title,
      required this.content,
      required this.description,
      required this.url,
      required this.urlToImage});
}
