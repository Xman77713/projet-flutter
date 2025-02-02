import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projet_final/res/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/issuesPageBloc.dart';
import '../card/card_comics.dart';

class ListComics extends StatefulWidget {
  const ListComics({super.key});

  @override
  State<ListComics> createState() => _ListComicsState();
}

class _ListComicsState extends State<ListComics> {
  IssuesListPageState? state;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoadDataIssuesListBloc(),
        child: BlocBuilder<LoadDataIssuesListBloc, IssuesListPageState>(
          builder: (BuildContext context, state) {
            return switch (state) {
              IssuesListPageNotifierLoadingState() => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              IssuesListPageNotifierErrorState() => Scaffold(
                  body: Center(
                    child: Text(state.error.toString(),
                        style: const TextStyle(color: AppColors.text)),
                  ),
                ),
              IssuesListPageNotifierSuccessState() => Scaffold(
                  backgroundColor: AppColors.screenBackground,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          child: Container(
                            margin: const EdgeInsets.only(top: 30, left: 32),
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Comics les plus populaires',
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  color: AppColors.text,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: List.generate(
                                    state.issuesList.issuesListModel.length,
                                    (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: CardComics(
                                        issue: state
                                            .issuesList.issuesListModel[index],
                                        index: index + 1,
                                      ),
                                    ),
                                  ),
                                ))),
                      ],
                    ),
                  ),
                )
            };
          },
        ));
  }
}
