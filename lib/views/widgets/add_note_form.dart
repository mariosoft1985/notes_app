import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomAppBar(
                  title: '',
                  icon: Icons.save,
                  iconOnPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formattedCurrentDate =
                          DateFormat('yMMMMd').format(currentDate);
                      var noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          date: formattedCurrentDate,
                          color: Colors.blue.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            CustomTextField(
              fontSize: 28,
              onSaved: (value) {
                title = value;
              },
              hint: 'title'.tr(),
            ),
            CustomTextField(
              onSaved: (value) {
                subTitle = value;
              },
              hint: 'content'.tr(),
              maxLines: 10,
              fontSize: 20,
            ),
            const SizedBox(
              height: 32,
            ),
            const ColorsListView(),
          ],
        ),
      ),
    );
  }
}
