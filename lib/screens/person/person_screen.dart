import 'package:flutter/material.dart';
import 'package:flutter_application_37/screens/person/bloc/character_bloc.dart';
import 'package:flutter_application_37/screens/person/widgets/getStatusColor.dart';
import 'package:flutter_application_37/screens/person/widgets/is_row.dart';
import 'package:flutter_application_37/screens/person/widgets/person_widget.dart';
import 'package:flutter_application_37/screens/person/widgets/search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  late CharacterBloc personBloc;

  @override
  void initState() {
    personBloc = CharacterBloc();
    personBloc.add(GetCharacterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Search(titleSearch: "Найти пепрсонажа "),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Less_information(describetion: "Всего персонажей  "),
              IconButton(
                  onPressed: () {
                    setState(() {
                      Isrow.isRow = !Isrow.isRow;
                    });
                  },
                  icon: Icon(
                    Isrow.isRow ? Icons.move_down : Icons.menu,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: BlocConsumer<CharacterBloc, CharacterState>(
            bloc: personBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is PersonLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PersonErrorState) {}
              if (state is CharacterFetchedState) {
                return Isrow.isRow
                    ? GridView.builder(
                        itemCount: state.model.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 180,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) => Container(
                          width: 180.w,
                          height: 5.h,
                          child:
                           Column(
                             children: [
                               
                               MainPerson(
                                imgPerson: state.model[index].image!,
                                name: state.model[index].name ?? "unkown",
                                isLive: state.model[index].status!,
                                isMan: state.model[index].gender!,
                          ),
                             ],
                           ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: state.model.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                maxRadius: 40,
                                backgroundImage:
                                    NetworkImage(state.model[index].image!),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.07,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.model[index].status!,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: getStatusColor(
                                          state.model[index].status!),
                                    ),
                                  ),
                                  Text(
                                    state.model[index].name!,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                      "${state.model[index].species!}, ${state.model[index].gender}"),
                                ],
                              ),
                              SizedBox(height: 20.h,)
                            ],
                          );
                        },
                      );
                ;
              }
              return SizedBox();
            },
          )),
        ],
      ),
    );
  }
}
