import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ArticleModal {
  int threshold = 0;
  int totalPage = 0;
  List<News> news = [];

  bool get isEmpty => threshold == 0;

  ArticleModal();

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['news'] = news.map((v) => v.toJson()).toList();
    json['threshold'] = threshold;
    json['totalpage'] = totalPage;
    return json;
  }

  ArticleModal.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    (json['news'] ?? []).forEach((v) {
      news.add(News.fromJson(v));
    });
    threshold = json['threshold'];
    totalPage = json['totalpage'];
  }
}

//ignore: must_be_immutable
class News extends Equatable {
  int? id;
  String? tag;
  String? url;
  String? slug;
  String? tagId;
  String? title;
  String? tagUrl;
  String? section;
  String? summary;
  String? newsType;
  String? timestamp;
  String? sectionId;
  String? sectionUrl;
  String? mainTagUrl;
  String? highlights;
  String? thumbnailUrl;

  News();

  @override
  List<Object?> get props => [
        id,
        tag,
        url,
        slug,
        tagId,
        title,
        tagUrl,
        section,
        summary,
        newsType,
        timestamp,
        sectionId,
        sectionUrl,
        mainTagUrl,
        highlights,
        thumbnailUrl,
      ];

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['thumbnail_url'] = thumbnailUrl;
    json['main_tag_url'] = mainTagUrl;
    json['section_url'] = sectionUrl;
    json['highlights'] = highlights;
    json['section_id'] = sectionId;
    json['timestamp'] = timestamp;
    json['news_type'] = newsType;
    json['summary'] = summary;
    json['section'] = section;
    json['tag_url'] = tagUrl;
    json['tag_id'] = tagId;
    json['title'] = title;
    json['slug'] = slug;
    json['url'] = url;
    json['tag'] = tag;
    json['id'] = id;
    return json;
  }

  News.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    thumbnailUrl = json['thumbnail_url'];
    mainTagUrl = json['main_tag_url'];
    sectionUrl = json['section_url'];
    highlights = json['highlights'];
    sectionId = json['section_id'];
    timestamp = json['timestamp'];
    newsType = json['news_type'];
    section = json['section'];
    summary = json['summary'];
    tagUrl = json['tag_url'];
    tagId = json['tag_id'];
    title = json['title'];
    slug = json['slug'];
    url = json['url'];
    tag = json['tag'];
    id = json['id'];
  }

  String getDifference() {
    String? input = timestamp;
    if (input == null) return '';
    DateTime currentDate = DateTime.now();
    DateTime tempDate = DateFormat('yyyy-MM-dd hh:mm:ss').parse(input);

    if (currentDate.difference(tempDate).inDays != 0) {
      return '${currentDate.difference(tempDate).inDays} days ago';
    }

    if (currentDate.difference(tempDate).inHours != 0) {
      return '${currentDate.difference(tempDate).inHours} hours ago';
    }

    if (currentDate.difference(tempDate).inMinutes != 0) {
      return '${currentDate.difference(tempDate).inMinutes} minutes ago';
    }

    return '${currentDate.difference(tempDate).inSeconds} seconds ago';
  }

  @override
  String toString() => jsonEncode(toJson());
}
