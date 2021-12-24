import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeenews/bloc/bloc.dart';

import 'view/list_view.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {

  @override
  void initState() {
    super.initState();
    context.read<ArticleBloc>().fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
        builder: (_, ArticleState state) {
      // Data loading error
      if (state is ArticleError) {
        return Center(
          child: Text(
            state.error,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 24,
            ),
          ),
        );
      }
      // Data load successfully
      if (state is ArticleLoaded) {
        var modal = state.article;
        return modal.isEmpty
            ? EmptyWidget(
                title: 'Empty',
                subTitle: 'No Record Found',
                packageImage: PackageImage.Image_2,
              )
            : ArticleView(modal.news);
      }
      // show progress
      return const Center(child: CircularProgressIndicator());
    });
  }

}
