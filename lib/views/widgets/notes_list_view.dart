import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'note_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: notes.length.isOdd
              ? StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return NoteItem(
                      note: notes[index],
                    );
                  },
                )
              : ListView.builder(
                  itemCount: notes.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      child: NoteItem(
                        note: notes[index],
                      ),
                    );
                  }),
        );
      },
    );
  }
}
