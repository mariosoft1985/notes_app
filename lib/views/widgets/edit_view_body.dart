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
              const SizedBox(
                height: 10,
              ),
              CustomAppBar(
                iconOnPressed: () {
                  widget.note.title = titleController.text;
                  widget.note.subTitle = contentdController.text;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                title: 'editeNote'.tr(),
                icon: Icons.save,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: titleController,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: contentdController,
                maxLines: 15,
              ),
              const SizedBox(
                height: 16,
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
