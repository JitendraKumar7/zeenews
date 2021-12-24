import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:zeenews/modal/modal.dart';

class DetailView extends StatelessWidget {
  final DetailModal modal;

  const DetailView(this.modal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var detail = modal.newsDetail;
    return ListView(children: [
      CachedNetworkImage(
        imageUrl: detail.thumbnailUrl ?? 'null',
        progressIndicatorBuilder: (_, url, progress) =>
            const CupertinoActivityIndicator(),
        errorWidget: (_, url, error) => const Icon(Icons.error),
        //height: size.width / 1.9,
        width: size.width,
        fit: BoxFit.fill,
      ),
      Card(
        margin: const EdgeInsets.only(left: 6, right: 6),
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(3),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                child: Text(
                  detail.title ?? '',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              // IntrinsicHeight user because VerticalDivider
              Container(
                padding: const EdgeInsets.all(9),
                child: IntrinsicHeight(
                  child: Row(children: [
                    Text(
                      detail.author ?? '',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      child: VerticalDivider(thickness: 1.5),
                      height: 24,
                    ),
                    Text(
                      detail.timestamp ?? '',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                    Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.6,
                          color: Colors.blue,
                        ),
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.blue,
                      ),
                    )
                  ]),
                ),
              ),
              const Divider(color: Colors.black),
              const SizedBox(height: 9),
              Html(data: detail.content),
              const SizedBox(height: 9),
              //tags
              const Text(
                'TAGS',
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 9),
              SizedBox(
                height: 45,
                width: size.width,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: modal.tags
                        .map((e) => Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(6),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(e.title ?? '')))
                        .toList()),
              ),
              const SizedBox(height: 9),
            ]),
      ),
    ]);
  }
}
