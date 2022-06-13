import 'package:flutter/material.dart';
import 'package:flutter_application_37/const/commands.dart';
import 'package:flutter_application_37/screens/location/bloc/location_bloc.dart';
import 'package:flutter_application_37/screens/person/widgets/person_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Planet extends StatefulWidget {
  const Planet({Key? key}) : super(key: key);

  @override
  State<Planet> createState() => _PlanetState();
}

class _PlanetState extends State<Planet> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    locationBloc = LocationBloc();
    locationBloc.add(GetLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocationBloc, LocationState>(
          bloc: locationBloc,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is LocationLoadingState) {}
            if (state is LocationFetchedState) {
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
                                "assets/images/c137.png",
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
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Mir"),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Text(state.model[index]
                                                        .dimension!),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 32.h,
                                                ),
                                                Text(
                                                    "Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.",
                                                    style: TextHelper.small13),
                                                SizedBox(height: 36.h),
                                                Text(
                                                  "Perons",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
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
                        )
                      ]));
            }

            return SizedBox();
          }),
    );
  }
}
