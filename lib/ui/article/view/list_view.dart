import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeenews/modal/modal.dart';

class ArticleView extends StatelessWidget {
  const ArticleView(this.news, {Key? key}) : super(key: key);

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (_, index) {
        var modal = news[index];

        return index == 0
            ? Container(
                padding: const EdgeInsets.all(18),
                child: InkWell(
                  onTap: () => onClick(context, modal),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              modal.tag ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            modal.title ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        modal.thumbnailUrl ?? 'null'),
                  ),
                  color: Colors.grey,
                ),
                height: MediaQuery.of(context).size.width / 1.72,
              )
            : Container(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () => onClick(context, modal),
                  title: Text(
                    modal.tag ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          modal.title ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        Text(
                          modal.getDifference(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ]),
                  trailing: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(6)),
                    //child: Image.network(modal.thumbnailUrl ?? 'null'),
                    child: CachedNetworkImage(
                      imageUrl: modal.thumbnailUrl ?? 'null',
                      progressIndicatorBuilder: (_, url, progress) =>
                          const CupertinoActivityIndicator(),
                      errorWidget: (_, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              );
      },
    );
  }

  void onClick(BuildContext context, News modal) {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: modal.url,
    );
  }
}
