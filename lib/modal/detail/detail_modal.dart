import 'dart:convert';

class DetailModal {
  var newsDetail = NewsDetail();
  List<Tags> tags = [];
  String? editorList;

  DetailModal();

  DetailModal.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    newsDetail = NewsDetail.fromJson(json['NewsDetail']);
    editorList = json['editorList'];
    (json['tags'] ?? []).forEach((v) {
      tags.add(Tags.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['editorList'] = editorList;
    json['NewsDetail'] = newsDetail.toJson();
    json['tags'] = tags.map((v) => v.toJson()).toList();
    return json;
  }

  @override
  String toString() => jsonEncode(toJson());
}

class NewsDetail {
  String? id;
  String? source;
  String? author;
  String? title;
  String? timestamp;
  String? section;
  String? slug;
  String? sectionId;
  String? content;
  String? websiteUrl;
  String? thumbnailUrl;
  String? sectionUrl;
  String? url;
  String? newsType;
  String? highlights;
  String? comments;

  NewsDetail();

  NewsDetail.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'];
    source = json['source'];
    author = json['author'];
    title = json['title'];
    timestamp = json['timestamp'];
    section = json['section'];
    slug = json['slug'];
    sectionId = json['section_id'];
    content = json['content'];
    websiteUrl = json['websiteurl'];
    thumbnailUrl = json['thumbnail_url'];
    sectionUrl = json['section_url'];
    url = json['url'];
    newsType = json['news_type'];
    highlights = json['highlights'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['source'] = source;
    json['author'] = author;
    json['title'] = title;
    json['timestamp'] = timestamp;
    json['section'] = section;
    json['slug'] = slug;
    json['section_id'] = sectionId;
    json['content'] = content;
    json['websiteurl'] = websiteUrl;
    json['thumbnail_url'] = thumbnailUrl;
    json['section_url'] = sectionUrl;
    json['url'] = url;
    json['news_type'] = newsType;
    json['highlights'] = highlights;
    json['comments'] = comments;
    return json;
  }

  @override
  String toString() => jsonEncode(toJson());
}

class Tags {
  int? topicID;
  String? title;
  String? sectionPageURL;

  Tags();

  Tags.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    title = json['title'];
    topicID = json['topicID'];
    sectionPageURL = json['sectionPageURL'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['title'] = title;
    json['topicID'] = topicID;
    json['sectionPageURL'] = sectionPageURL;
    return json;
  }

  @override
  String toString() => jsonEncode(toJson());
}
