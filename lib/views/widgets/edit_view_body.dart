import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  //String? title, content;
  late TextEditingController titleController;
  late TextEditingController contentdController;

  @override
  void initState() {
    // TODO: implement initState
    titleController = TextEditingController(text: widget.note.title);
    contentdController = TextEditingController(text: widget.note.subTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                iconOnPressed: () {
                  widget.note.title = titleController.text;
                  widget.note.subTitle = contentdController.text;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                title: '',
                icon: Icons.save,
              ),
              CustomTextField(
                controller: titleController,
                fontSize: 28,
                hint: 'title'.tr(),
              ),
              CustomTextField(
                controller: contentdController,
                maxLines: 10,
                fontSize: 20,
                hint: 'content'.tr(),
              ),
              EditNoteColorsList(
                note: widget.note,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
