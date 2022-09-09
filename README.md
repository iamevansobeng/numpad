### Description

Numpad Widget for Pin Input. Feel free to make pull requests and drop suggestions ✌️ .

##### Parameters

| Param             | Required |     Default     |      Type      |             Description              |
| ----------------- | :------: | :-------------: | :------------: | :----------------------------------: |
| onTap             |    ✅    |      null       | Function (int) |   Triggerred when number is tapped   |
| mainAxisSpacing   |    ❌    |      null       |     double     |          Main Axis Spacing           |
| crossAxisSpacing  |    ❌    |      null       |     double     |          Cross Axis Spacing          |
| clearIcon         |    ❌    | Icons.backspace |      Icon      |       Icon for clear or delete       |
| themeColor        |    ❌    |   Colors.grey   |     Color      |             theme color              |
| textStyle         |    ❌    |       --        |   TextStyle    |        Style for Number Text         |
| numItemDecoration |    ❌    |       --        |   Decoration   | Decoration for number item or button |
| buttonSize        |    ❌    |      30.0       |     double     |       Size of button container       |
| backgroundColor   |    ❌    |  Colors.white   |     Color      |     Color for NumPad background      |
| iconSize          |    ❌    |      30.0       |     double     | Size of Country Flag on Input Label  |

### How To Use

1. Import the package
   ```
   import 'package:numpad/numpad.dart';
   ```
2. Provide at least the required params

   ```
   NumPad(
        onTap: (val) {
        if (val == 99) {
            if (code.isNotEmpty) {
            setState(() {
                code = code.substring(0, code.length - 1);
            });
            }
        } else {
            setState(() {
            code += "$val";
            });
        }
        print(code);
        },
    ),

   ```
