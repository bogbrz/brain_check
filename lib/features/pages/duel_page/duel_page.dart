import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/duel_page/cubit/duel_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DuelPage extends StatelessWidget {
  DuelPage({
    super.key,
  });
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DuelPageCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 58, 93),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.extended(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Text("Create new game"),
                                content: Form(
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Text("Room name"),
                                      ],
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              85,
                                        )),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              85,
                                        )),
                                      ),
                                      controller: nameController,
                                    ),
                                    Row(
                                      children: [
                                        Text("Password"),
                                      ],
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              85,
                                        )),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              85,
                                        )),
                                      ),
                                      controller: passControler,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            await context
                                                .read<DuelPageCubit>()
                                                .createRoom(
                                                    name: nameController.text,
                                                    password:
                                                        passControler.text)
                                                .then((value) {
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: Text("Create")),
                                    )
                                  ]),
                                ),
                              );
                            });
                      },
                      label: Row(
                        children: [Text("Create new room"), Icon(Icons.add)],
                      )),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
