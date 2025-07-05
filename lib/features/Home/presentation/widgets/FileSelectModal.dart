import 'package:flutter/cupertino.dart';

class FileSelectModal extends StatefulWidget {
  const FileSelectModal({super.key});

  @override
  State<FileSelectModal> createState() => _FileSelectModalState();
}

class _FileSelectModalState extends State<FileSelectModal> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [Text('Selected File')]));
  }
}
