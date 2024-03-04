import 'package:any_news/helper/data.dart';
import 'package:any_news/models/category_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Any"),
            Text("News", style: TextStyle(color: Colors.greenAccent),)
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 70,
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
          )
        ],
      ),
    );
  }
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
              borderRadius: BorderRadius.circular(6),
                child: Image.asset(imgUrl!, width: 120, height: 60, fit: BoxFit.cover,),
            ),
            Container(
              alignment: Alignment.center,
              width: 120, height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
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
  final String imgUrl, title, desc;

  BlogTile({required this.imgUrl, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imgUrl),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}