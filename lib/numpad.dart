library numpad;

import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  const NumPad({
    Key? key,
    required this.onTap,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.clearIcon,
    this.themeColor,
    this.textStyle,
    this.numItemDecoration,
    this.buttonSize,
    this.backgroundColor,
    this.iconSize,
  }) : super(key: key);

  // TRIGGERED ON EACH BUTTON TAB, RETURNS THE BUTTON CLICKED INT OR 99 IF CLEAR BUTTON
  final ValueChanged<int> onTap;

  // VALUE FOR MAIN AXIS SPACING OF NUMPAD
  final double? mainAxisSpacing;

  // VALUE FOR CROSS AXIS SPACING OF NUMPAD
  final double? crossAxisSpacing;

  // OPTIONAL ICON FOR CLEAR BUTTON
  final Icon? clearIcon;

  // COLOR FOR THE WHOLE WIDGET THEME
  final Color? themeColor;

  // STYLE FOR THE TEXT ON THE NUMBER ITEM
  final TextStyle? textStyle;

  // DECORATION FOR THE NUMBER CONTAINER
  final Decoration? numItemDecoration;

  // VALUE FOR NUMBER ITEM SIZE
  final double? buttonSize;

  // COLOR FOR NUMPAD WIDGET BACKGROUND COLOR
  final Color? backgroundColor;

  // VALUE FOR NUMBER TEXT SIZE - WON'T WORK IF YOU PROVIDE clearIcon
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    /****************************
     * DEFAULT VALUES
     ****************************/
    var size = MediaQuery.of(context).size;
    const values = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    var mSpacing = size.width * 0.06;
    var cSpacing = size.height * 0.06;

    return Container(
      height: size.height * 0.45,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      color: backgroundColor ?? Colors.white,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: mainAxisSpacing ?? mSpacing,
        crossAxisSpacing: crossAxisSpacing ?? cSpacing,
        crossAxisCount: 3,
        children: [
          ...List.generate(
            values.length,
            (index) => numItem(value: values[index], onTap: onTap),
          ),
          const SizedBox(),
          numItem(value: 0, onTap: onTap),

          // THE CLEAR OR DELETE BUTTON
          numItem(
            value: 99,
            onTap: onTap,
            widget: Icon(
              Icons.backspace_outlined,
              size: iconSize ?? 30,
              color: themeColor ?? Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget numItem({
    required int value,
    required Function onTap,
    Widget? widget,
  }) {
    var textSize = 38.0;
    var _buttonSize = 40.0;
    return InkWell(
      onTap: (() => onTap(value)),
      child: Container(
        width: buttonSize ?? _buttonSize,
        height: buttonSize ?? _buttonSize,
        decoration: numItemDecoration ??
            BoxDecoration(
                border: Border.all(
                  color: themeColor ?? Colors.blueGrey,
                  width: 0.6,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: widget ??
              Text(
                "$value",
                style: textStyle ??
                    TextStyle(
                      fontSize: textSize,
                      color: themeColor ?? Colors.blueGrey,
                    ),
              ),
        ),
      ),
    );
  }
}
