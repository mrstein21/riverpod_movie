import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_trial/mixins/style/color.dart';
import 'package:movie_trial/riverpod_change_notifier.dart';
import 'package:movie_trial/ui/detail/widget/content_section.dart';
import 'package:movie_trial/ui/detail/widget/cover_section.dart';
import 'package:movie_trial/ui/detail/widget/section_header.dart';

class DetailScreen extends ConsumerWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final _detailViewModel=ref.watch(detailViewModel(id));
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorDark,
        body: _detailViewModel.isLoading?Container(
              width: double.infinity,
              height: double.infinity,
              color: kColorBlack,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ):
          NestedScrollView(
              headerSliverBuilder:  (BuildContext context, bool innerBoxIsScrolled){
                return <Widget>[
                  SliverLayoutBuilder(
                    builder: (context, constraint) {
                      return SliverAppBar(
                        elevation: 0,
                        floating: true,
                        backgroundColor: kColorDark,
                        expandedHeight: 340,
                        pinned: true,
                        title: constraint.scrollOffset > 10
                            ? SectionHeader(
                          name: _detailViewModel.detailMovie.title!,
                        )
                            : Container(),
                        centerTitle: false,
                        automaticallyImplyLeading: false,
                        titleSpacing: 0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: CoverSection(
                             movie: _detailViewModel.detailMovie,
                          ),
                        ),
                      );
                    },
                  )
                ];
              }, 
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentSection(movie: _detailViewModel.detailMovie)
                ],
              )
          )
      )
    );
  }
}
