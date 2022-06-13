import 'package:flutter/material.dart';
import 'package:flutter_application_37/const/commands.dart';
import 'package:flutter_application_37/screens/episode/bloc/episode_bloc.dart';
import 'package:flutter_application_37/screens/location/bloc/location_bloc.dart';
import 'package:flutter_application_37/screens/person/widgets/person_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Episode1 extends StatefulWidget {
  const Episode1({Key? key}) : super(key: key);

  @override
  State<Episode1> createState() => _Episode1tate();
}

class _Episode1tate extends State<Episode1> {
  late EpisodeBloc epsiodeBloc;

  @override
  void initState() {
    epsiodeBloc = EpisodeBloc();
    epsiodeBloc.add(GetEpisodeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EpisodeBloc, EpisodeState>(
          bloc: epsiodeBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is EpsiodeLoadingState) {}
            if (state is EpisodeFetchedState) {
              return SizedBox(
                  height: 1.sh,
                  child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.antiAlias,
                      children: <Widget>[
                        Positioned(
                          child: Container(
                              width: 383.w,
                              height: 298.h,
                              child: Image.asset(
                                "assets/images/park.png",
                                fit: BoxFit.cover,
                              )),
                        ),
                        Positioned(
                          left: 9.w,
                          top: 20.h,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        
                        Positioned(
                          top: 270.h,
                          child: SingleChildScrollView(
                            child: Container(
                              width: 375.w,
                              height: 886.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(26.r)),
                              child: SizedBox(
                                child: ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(left: 16.r),
                                        child: SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.model[index].name!,
                                                  style: TextStyle(
                                                    fontSize: 24.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                    "Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.",
                                                    style: TextHelper.small13),
                                                SizedBox(height: 36.h),
                                                Text(
                                                  "Episodes",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  
                                                  children: [Text("Примьера",style: TextHelper.small12, ), Text(state.model[index].airDate!, style: TextHelper.medium14,)],),
                                                
                                                SizedBox(height: 36,),
                                                
                                                Divider(color: Colors.black, endIndent: 10,),
                                                
                                                SizedBox(height: 36,),
                                                Text("Персонажи", style: TextHelper.medium16.copyWith(color: ThemeHelper.black),),
                                                SizedBox(
                                                  width: 243.w,
                                                  height: 1.sw,
                                                  child: ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        state.model.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return SizedBox();
                                                    },
                                                  ),
                                                )
                                              ]),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ),Positioned(
                            top: 201.h,
                            left: 138,
                            child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(color: ThemeHelper.black, offset: Offset(0, 4,), blurRadius:(30))],
                                    color: ThemeHelper.lightBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: IconButton(
                                  icon: Icon(Icons.play_arrow),
                                  onPressed: () {},
                                ))),
                      ]));
            }

            return SizedBox();
          }),
    );
  }
}
