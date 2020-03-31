# option_picker

This package was created to use for choosing between the camera gallery and taking a picture, but it can be used for any two option scenario.

## Screenshots

IOS             |  ANDROID
:-------------------------:|:-------------------------:
![](https://raw.githubusercontent.com/cmaccarone/option_picker/master/IOS.png) | ![](https://raw.githubusercontent.com/cmaccarone/option_picker/master/Android.png)

### HOW TO USE

just implement the OptionPicker.Show(); method and you are good to go!
```
onPressed: () {
OptionPicker.show(
            context: context,
            title: "Choose Photo",
            subtitle: "",
            firstButtonText: "Gallery",
            onPressedFirst: () {
              //open photo gallery
            },
            secondButtonText: "Take a Picture",
            onPressedSecond: () {
              //open camera
            },
          );
}
```

