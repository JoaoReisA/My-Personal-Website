import 'package:flutter/material.dart';
import 'package:my_personal_website/config/strings.dart';

class ChangeAvatarConfigs extends StatelessWidget {
  ChangeAvatarConfigs({
    Key? key,
    required this.showSelectionBanner,
    required this.onClickBack,
    required this.onClickFoward,
    required this.gradient,
    required this.onClickColor,
  }) : super(key: key);
  final bool showSelectionBanner;
  final VoidCallback onClickBack;
  final VoidCallback onClickFoward;
  LinearGradient gradient;
  final Function(LinearGradient) onClickColor;
  final List listOfGradients = const [
    LinearGradient(colors: [
      Colors.blue,
      Colors.purple,
    ], begin: Alignment.bottomLeft),
    LinearGradient(colors: [
      Colors.pink,
      Colors.purple,
    ], begin: Alignment.bottomLeft),
    LinearGradient(colors: [
      Colors.yellow,
      Colors.purple,
    ], begin: Alignment.bottomLeft),
    LinearGradient(colors: [
      Colors.green,
      Colors.purple,
    ], begin: Alignment.bottomLeft),
    LinearGradient(colors: [
      Colors.brown,
      Colors.purple,
    ], begin: Alignment.bottomLeft),
    LinearGradient(colors: [
      Colors.grey,
      Colors.purple,
    ], begin: Alignment.bottomLeft),
  ];

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showSelectionBanner,
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
                        onTap: onClickBack,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: Colors.deepPurple,
                        ),
                      ),
                      InkWell(
                        onTap: onClickFoward,
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
                child: GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          // gradient = listOfGradients[index];
                          onClickColor(listOfGradients[index]);
                        },
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            gradient: listOfGradients[index],
                          ),
                        ));
                  },
                ),
              )
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
