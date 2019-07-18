import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'article.g.dart';


@JsonSerializable()
class Article {
  final String title;
  final String url;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  final User user;

  Article({
    this.title,
    this.url,
    this.likesCount,
    this.user
  });

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
