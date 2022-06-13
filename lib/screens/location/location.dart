
import 'package:flutter/material.dart';
import 'package:flutter_application_37/screens/location/bloc/location_bloc.dart';
import 'package:flutter_application_37/screens/location/widgets.dart';
import 'package:flutter_application_37/screens/person/widgets/less_information.dart';
import 'package:flutter_application_37/screens/person/widgets/search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    locationBloc = LocationBloc();
    locationBloc.add(GetLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        const Search(titleSearch: "Найти локацию"),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: BlocConsumer<LocationBloc, LocationState>(
            bloc: locationBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LocationLoadingState) {}
              if (state is LocationFetchedState) {
                return Column(
                  children: [
                    Less_information(
                      isLogo: true,
                        describetion:
                            "ВСЕГО ЛОКАЦИЙ: ${state.model.length}"),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.model.length,
                        itemBuilder: (context, index) {
                          return Planets(
                          imageUrl: 'assets/images/park.png',
                          title: state.model[index].name!,
                          subtitleHeader: state.model[index].dimension!,
                          );
                        },
                       
                        padding: const EdgeInsets.all(0),
                        
                      ),
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ),
      ]),
    );
  }
}
