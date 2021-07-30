import 'package:flutter/material.dart';
import 'package:pharma/controllers/NotesController.dart';
import 'package:pharma/models/NoteModel.dart';

//needs edit

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
    notes = notesController.showNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'الاقتراحات والشكاوي',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
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
                      title: Text(snapshot.data[index].pharmacyName),
                      subtitle: Text(snapshot.data[index].notes),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          var response = await notesController
                              .deleteNote(snapshot.data[index].id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                response,
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
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
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
