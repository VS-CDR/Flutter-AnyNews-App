import '../models/category_model.dart';

List<CategoryModel> getCategories() {
//   const jsonArray = '''
//   [{"categoryName": "Economics", "imgUrl": "assets/news_categories/ibrahim-boran-_aUwE2DnIPg-unsplash.jpg"},
//    {"categoryName": "Politics", "imgUrl": "assets/news_categories/marco-oriolesi-wqLGlhjr6Og-unsplash.jpg"},
//    {"categoryName": "Sports", "imgUrl": "assets/news_categories/mario-klassen-70YxSTWa2Zw-unsplash.jpg"},
//    {"categoryName": "Science", "imgUrl": "assets/news_categories/ousa-chea-gKUC4TMhOiY-unsplash.jpg"}]
// ''';

  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);
  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.imgUrl = 'assets/news_categories/ibrahim-boran-_aUwE2DnIPg-unsplash.jpg';
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imgUrl = 'assets/news_categories/marco-oriolesi-wqLGlhjr6Og-unsplash.jpg';
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imgUrl = 'assets/news_categories/mario-klassen-70YxSTWa2Zw-unsplash.jpg';
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imgUrl = 'assets/news_categories/ousa-chea-gKUC4TMhOiY-unsplash.jpg';
  categories.add(categoryModel);

  return categories;
}