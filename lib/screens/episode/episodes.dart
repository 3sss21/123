import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_37/const/commands.dart';
import 'package:flutter_application_37/screens/episode/bloc/episode_bloc.dart';
import 'package:flutter_application_37/screens/person/widgets/search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EpisodeInfoScreen extends StatefulWidget {
  final String? imageUrl;
  final String? nameEpisode;
  final int? numEpisode;
  final String? dtEpisode;
  final String? description;

  const EpisodeInfoScreen({
    Key? key,
    required this.imageUrl,
    required this.nameEpisode,
    required this.numEpisode,
    required this.dtEpisode,
this.description,
  }) : super(key: key);

  @override
  State<EpisodeInfoScreen> createState() => _EpisodeInfoScreenState();
}

class _EpisodeInfoScreenState extends State<EpisodeInfoScreen> {
  late EpisodeBloc episodesBloc;

  @override
  void initState() {
    episodesBloc = EpisodeBloc();
    episodesBloc.add(GetEpisodeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Search(titleSearch: "searc episode"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36.h),
        
                SizedBox(height: 36.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Персонажи',
                        style: TextHelper.large20,
                      ),
                      BlocConsumer<EpisodeBloc, EpisodeState>(
                          bloc: episodesBloc,
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is EpsiodeLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (state is EpisodeErrorState) {
                              return ElevatedButton(
                                onPressed: () =>
                                    episodesBloc.add(GetEpisodeEvent()),
                                child: const Text('Try Again'),
                              );
                            }
                            if (state is EpisodeFetchedState) {
                              return SizedBox(
                                width: 1.sw,
                                height: 200.h,
                              );
                            }
                            return SizedBox();
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
                              // child: ListView.separated(
                              //   // physics: const NeverScrollableScrollPhysics(),
                              //   itemCount: state.model.length,
                              //   itemBuilder: (context, index) =>
                              //       CustomDataContainerWidget(
                              //     imageUrl:
                              //         state.model[index].image,
                              //     imageWeight: 74,
                              //     imageHeight: 74,
                              //     isAlive:true
                          