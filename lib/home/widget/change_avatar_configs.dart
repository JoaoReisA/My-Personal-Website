import 'package:flutter/material.dart';
import 'package:my_personal_website/config/strings.dart';
import 'package:my_personal_website/home/widget/color_picker.dart';

class ChangeAvatarConfigs extends StatefulWidget {
  ChangeAvatarConfigs({
    Key? key,
    required this.showSelectionBanner,
    required this.onClickBack,
    required this.onClickFoward,
    required this.onClickColor,
    required this.color,
  }) : super(key: key);
  final bool showSelectionBanner;
  final VoidCallback onClickBack;
  final VoidCallback onClickFoward;
  final Function(Color) onClickColor;
  Color color;
  @override
  State<ChangeAvatarConfigs> createState() => _ChangeAvatarConfigsState();
}

class _ChangeAvatarConfigsState extends State<ChangeAvatarConfigs> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.showSelectionBanner,
      child: Container(
        height: 150,
        width: 120,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black54, offset: Offset(-0.5, 1))
          ],
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(Strings.avatar),
                  Row(
                    children: [
                      InkWell(
                        onTap: widget.onClickBack,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: Colors.deepPurple,
                        ),
                      ),
                      InkWell(
                        onTap: widget.onClickFoward,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.deepPurple,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(Strings.background),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 90,
                  height: 60,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (child) {
                            return AlertDialog(
                              title: const Text("Selecione uma cor"),
                              content: SingleChildScrollView(
                                child: ColorPickerWidget(
                                  color: widget.color,
                                  onColorChanged: widget.onClickColor,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Feito!'),
                                  onPressed: () {
                                    widget.onClickColor;
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [widget.color, Colors.deepPurple],
                              begin: Alignment.bottomLeft)),
                    ),
                  )),
            ],
          ),
        ),
      ),
      replacement: Container(
        width: 120,
      ),
    );
  }
}
