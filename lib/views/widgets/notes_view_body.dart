import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'appTitle'.tr(),
            icon: Icons.search,
            iconButtonIcon: Icons.translate,
            iconButtonOnPressed: () {
              translator.setNewLanguage(
                context,
                newLanguage:
                    translator.activeLanguageCode == 'ar' ? 'en' : 'ar',
                remember: true,
                restart: true,
              );
            },
          ),
          const Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
