import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeenews/bloc/bloc.dart';
import 'package:zeenews/widget/widget.dart';

import 'view/detail_view.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    context.read<DetailBloc>().fetchDetail(args as String);
    return Scaffold(
      appBar: const SilverToolbar(),
      body:
          BlocBuilder<DetailBloc, DetailState>(builder: (_, DetailState state) {
        // Data loading error
        if (state is DetailError) {
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
        if (state is DetailLoaded) {
          var modal = state.detail;
          return DetailView(modal);
        }
        // show progress
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
