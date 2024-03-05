/*
  Fields are taken from NewsApi

Response Example:
{
  "status": "ok",
  "totalResults": 703,
 -"articles": [
    -{
      -"source": {
           "id": null,
         "name": "MacRumors"
      },
      "author": "Tim Hardwick",
      "title": "Apple Still Plans MicroLED Apple Watch Ultra, Seeks New Suppliers",
      "description": "Apple remains committed to microLED, despite recent reports that its project to bring the display technology to Apple Watch Ultra has been ditched.\n\n\n\n\n\nLast week, Apple supplier arms OSRAM announced that a \"cornerstone project\" was \"unexpectedly cancelled.\" …",
      "url": "https://www.macrumors.com/2024/03/04/apple-still-dedicated-microled-apple-watch-ultra/",
      "urlToImage": "https://images.macrumors.com/t/3ozjv0ZuRQN2pcJCES2-5Je9g8E=/3840x/article-new/2022/09/apple-watch-ultra-1-1.jpg",
      "publishedAt": "2024-03-04T10:56:48Z",
      "content": "Apple remains committed to microLED, despite recent reports that its project to bring the display technology to Apple Watch Ultra has been ditched, according to a new Taiwanese report.\r\nLast week, Ap… [+2525 chars]"
},
...
]
}
 */
final class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  ArticleModel({this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});
}