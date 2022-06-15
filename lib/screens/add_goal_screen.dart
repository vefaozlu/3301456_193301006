import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/helper/color_package.dart';
import 'package:pomodoro/helper/text_package.dart';

class AddGoalPanel extends StatefulWidget {
  const AddGoalPanel({Key? key}) : super(key: key);

  @override
  State<AddGoalPanel> createState() => _AddGoalPanelState();
}

class _AddGoalPanelState extends State<AddGoalPanel> {
  double sliderValue = 5;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        image: DecorationImage(
          alignment: Alignment.bottomRight,
          opacity: .75,
          image: AssetImage('assets/add_task.png'),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorPackage.firstGradientColor,
            ColorPackage.secondGradientColor,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: SizedBox(
          height: size.height * .5,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 40,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 32),
                      color: ColorPackage.primaryTextColor,
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: TextFormField(
                    cursorColor: ColorPackage.primaryTextColor,
                    textAlign: TextAlign.center,
                    controller: _controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a name b*tch ass';
                      }
                      return null;
                    },
                    style: TextPackage.normalTextStyle(
                      ColorPackage.primaryTextColor,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPackage.primaryTextColor,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPackage.primaryTextColor,
                        ),
                      ),
                      hintText: 'Goal Name',
                      hintStyle: TextPackage.lightTextStyle(
                        ColorPackage.primaryTextColor,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    AutoSizeText(
                      '${sliderValue.toInt()}',
                      minFontSize: 28,
                      style: TextPackage.normalTextStyle(
                        ColorPackage.primaryTextColor,
                      ),
                    ),
                    Slider(
                      onChanged: (value) => setState(() => sliderValue = value),
                      value: sliderValue,
                      min: 1,
                      max: 10,
                      // divisions: 10,
                      activeColor: ColorPackage.primaryTextColor,
                      thumbColor: ColorPackage.primaryTextColor,
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    primary: ColorPackage.primaryTextColor,
                  ),
                  child: AutoSizeText(
                    'Continue',
                    minFontSize: 28,
                    style: TextPackage.normalTextStyle(
                      ColorPackage.secondaryTextColor,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(_controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
