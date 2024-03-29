import 'package:any_news/helper/data.dart';

import 'package:any_news/models/category_model.dart';
import 'package:any_news/views/article_view.dart';
import 'package:any_news/views/category_news.dart';
import '../helper/news.dart';
import '../models/article_model.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final List<CategoryModel> categories;
  late final List<ArticleModel> articles;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
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
        children: <Widget>[
          Text("Any"),
          Text("News", style: TextStyle(color: Colors.greenAccent),)
        ],
      ),
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
          SizedBox(
            height: 64,
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CategoryTile(
                    imgUrl: categories[index].imgUrl,
                    categoryName: categories[index].categoryName,
                )
            ),
          ),

          /// Blogs
          Container(
            padding: const EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) => BlogTile(
                    imgUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description,
                    url: articles[index].url,
                )
            ),
          ),
        ],
      ),
    ),
  );
}

class CategoryTile extends StatelessWidget {
  final String? imgUrl, categoryName;

  const CategoryTile({super.key, this.imgUrl, this.categoryName});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryNews(category: categoryName!.toLowerCase())
      )
      );
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
              style:
              const TextStyle(
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

class BlogTile extends StatelessWidget {
  final String? imgUrl, title, desc, url;

  const BlogTile({super.key, required this.imgUrl, required this.title, required this.desc, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
                blogUrl: url!,
            )
          )
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
                child: Image.network(imgUrl!),
            ),
            Text(
              title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8,),
            Text(
              desc!,
            ),
          ],
        ),
      ),
    );
  }
}