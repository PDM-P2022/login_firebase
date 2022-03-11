import 'package:app_firebase/create/bloc/create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePage extends StatelessWidget {
  CreatePage({Key? key}) : super(key: key);
  var titleC = TextEditingController();
  var descrC = TextEditingController();
  var pictureC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreateBloc, CreateState>(
        listener: (context, state) {
          if (state is CreateSuccessState) {
            titleC.clear();
            descrC.clear();
            pictureC.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Guardado"),
              ),
            );
          } else if (state is CreateErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Hubo un error!!"),
              ),
            );
          }
        },
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.all(18),
            children: [
              TextField(
                controller: titleC,
                decoration: InputDecoration(
                  label: Text("titulo"),
                ),
              ),
              TextField(
                controller: descrC,
                decoration: InputDecoration(
                  label: Text("descripcion"),
                ),
              ),
              TextField(
                controller: pictureC,
                decoration: InputDecoration(
                  label: Text("link imagen"),
                ),
              ),
              MaterialButton(
                child: Text("Guardar"),
                onPressed: () {
                  BlocProvider.of<CreateBloc>(context).add(
                    AddNewTweetEvent(
                      tweetData: {
                        "title": titleC.text,
                        "description": descrC.text,
                        // "picture": pictureC.text,
                        "picture":
                            "https://us.123rf.com/450wm/tigatelu/tigatelu1410/tigatelu141000220/33368005-d%C3%A9cor%C3%A9-bande-dessin%C3%A9e-d-arbre-de-no%C3%ABl.jpg",
                        "osystem": ["iOS"],
                      },
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
