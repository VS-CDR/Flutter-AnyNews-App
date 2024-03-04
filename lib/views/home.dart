import 'package:any_news/helper/data.dart';

import 'package:any_news/models/category_model.dart';
import '../helper/news.dart';
import '../models/article_model.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);
  List<ArticleModel> articles = List<ArticleModel>.empty(growable: true);

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    News newsTable = News();
    await newsTable.getNews();

    articles = newsTable.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build (BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Any"),
          Text("News", style: TextStyle(color: Colors.greenAccent),)
        ],
      ),
      centerTitle: true,
    ),
    body: _loading
        ?
    const Center(child: CircularProgressIndicator(),)
        :
    SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[

          /// Categories
          Container(
            height: 64,
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    imgUrl: categories[index].imgUrl,
                    categoryName: categories[index].categoryName,
                  );
                }),
          ),

          /// Blogs
          Container(
            padding: const EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return BlogTile(
                    imgUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description
                  );
                }),
          ),
        ],
      ),
    ),
  );
}

class CategoryTile extends StatelessWidget {
  final String? imgUrl, categoryName;

  CategoryTile({super.key, this.imgUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
                child: Image.asset(imgUrl!, width: 116, height: 64, fit: BoxFit.cover,),
            ),
            Container(
              alignment: Alignment.center,
              width: 116, height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              child: Text(categoryName!,
                style: const TextStyle(
                    color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String? imgUrl, title, desc;

  BlogTile({super.key, required this.imgUrl, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imgUrl!),
          Text(title!),
          Text(desc!),
        ],
      ),
    );
  }
}