import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/controllers/NotesController.dart';
import 'package:pharma/models/NoteModel.dart';

class SuggestionsPage extends StatefulWidget {
  static const String id = 'SuggestionsPage';

  @override
  _SuggestionsPageState createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {
  NotesController notesController = NotesController();

  Future<List<NoteModel>> notes;

  @override
  void initState() {
    super.initState();
    notes = notesController.showNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        hasShoppingCart: false,
        title: 'الاقتراحات والشكاوي',
      ),
      body: FutureBuilder(
        future: notes,
        builder:
            (BuildContext context, AsyncSnapshot<List<NoteModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text('لا يوجد أي اقتراحات أو شكاوي'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(snapshot.data[index].pharmacyName,
                          textAlign: TextAlign.right),
                      subtitle: Text(snapshot.data[index].notes,
                          textAlign: TextAlign.right),
                      leading: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          var response = await notesController
                              .deleteNote(snapshot.data[index].id);
                          showSnackBar(response, context);
                          Navigator.of(context)
                              .pushReplacementNamed(SuggestionsPage.id);
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('لا يوجد اتصال بالانترنت'));
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xffffb52d),
              strokeWidth: 5,
            ),
          );
        },
      ),
    );
  }
}
