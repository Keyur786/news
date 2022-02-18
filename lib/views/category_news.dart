import 'package:flutter/material.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/article_model.dart';
import 'package:news/views/article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  const CategoryNews({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Opacity(
              opacity: 0,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Icon(Icons.save)),
            )
          ],
          foregroundColor: Colors.black,
          elevation: 0.0,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("Flutter",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
                Text("News",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600))
              ]),
          backgroundColor: Colors.transparent),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return BlogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description,
                          url: articles[index].url);
                    }),
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  String imageUrl, title, desc, url;
  BlogTile(
      {required this.imageUrl,
      required this.title,
      required this.desc,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(color: Colors.black54))
        ]),
      ),
    );
  }
}
