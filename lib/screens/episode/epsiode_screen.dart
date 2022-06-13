import 'package:flutter/material.dart';
import 'package:flutter_application_37/const/commands.dart';
import 'package:flutter_application_37/screens/episode/bloc/episode_bloc.dart';
import 'package:flutter_application_37/screens/episode/widgets/scene.dart';
import 'package:flutter_application_37/screens/person/widgets/search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen>
    with SingleTickerProviderStateMixin {
  late EpisodeBloc episodesBloc;
  late TabController _tabController;
  int index = 0;

  @override
  void initState() {
    episodesBloc = EpisodeBloc();
    episodesBloc.add(GetEpisodeEvent());
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EpisodeBloc, EpisodeState>(
          bloc: episodesBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is EpsiodeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is EpisodeErrorState) {
              return Center(
                child: ElevatedButton(
                  onPressed: () => episodesBloc.add(GetEpisodeEvent()),
                  child: const Text('Try Again'),
                ),
              );
            }

            if (state is EpisodeFetchedState) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 54.h,
                ),
                child: Column(children: [
                  Search(titleSearch: "Найти эпизод"),
                  SizedBox(height: 15.h),
                  TabBar(
                    controller: _tabController,
                    unselectedLabelColor: ThemeHelper.gray2,
                    labelColor: ThemeHelper.black,
                    indicatorColor: ThemeHelper.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    tabs: [
                      Text(
                        'СЕЗОН 1',
                        style: TextHelper.medium14,
                      ),
                      Text(
                        'СЕЗОН 2',
                        style: TextHelper.medium14,
                      ),
                      Text(
                        'СЕЗОН 3',
                        style: TextHelper.medium14,
                      ),
                    ],
                  ),
                  Expanded(
                    child:
            
                        Container(
                          width: 1.sw,
                          height: 500,
                          child: ListView.builder(
                            itemCount: state.model.length,
                    
                            itemBuilder: (context, index) => Scene(
                                titleOfEpisode: state.model[index].name!,
                                dateOfEpisode: state.model[index].airDate!,
                                episode: state.model[index].episode!,
                                imgUrl: "assets/sammer.png"),
                            
                          ),
                        ),
                      
                    ),
                  
                ]),
              );
            }
            return SizedBox();
          }),
    );
  }
}
