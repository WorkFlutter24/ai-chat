# Introducing AI-Chat App

Welcome to  AI-Chat App, a cutting-edge application designed to bring advanced AI capabilities to both iOS and Android platforms.
With a focus on enhancing user interaction and accessibility, AI-Chat App is packed with powerful features.

![ai_banner1](https://github.com/user-attachments/assets/a34e5e63-0550-4a8a-92c3-258dc2b59ffe)

## Features

- **Set up your API key** [scroll](#getting-started)
- **Initialize Gemini** [scroll](#initialize-gemini)
- **Content-based APIs** [scroll](#content-based-apis)
  - **Text-only input** [scroll](#text-only-input)
  - **Text-and-image input** [scroll](#text-and-image-input)
- **Advanced Usage** [scroll](#advanced-usage)
  - **Text-to-speech** [scroll](#text-to-speech)
  - **Speech-to-text** [scroll](#speech-to-text)
  - **Dark-light theme** [scroll](#dark-light-theme)
  - **Custom gallery** [scroll](#custom-gallery)
- **Gemini Widget** [scroll](#gemini-widget)

## Getting Started

To use the Gemini API, you'll need an API key. If you don't have, create a key in Google AI Studio. [Get an API key](https://ai.google.dev/).


## Initialize Gemini

For initialization, you must call the init constructor for Flutter Gemini in the main function.

```dart
void main() {

  /// Add this line
  Gemini.init(apiKey: '--- Your Gemini Api Key ---');

  runApp(const MyApp());
}
```

## Content-based APIs


https://github.com/user-attachments/assets/e15dbd1a-86e5-4ae3-9eaf-62f9cc0a16de


#### Text-only input


Using Gemini's streamGenerateContent method for text-only input allows you to receive partial results in real-time, enhancing interaction speed and user experience.
This ensures that users get immediate feedback from their AI queries without waiting for the entire response.

```dart
final gemini = Gemini.instance;

gemini.streamGenerateContent('Type content that you want to ask to the AI')
  .listen((value) {
    log(value.output);
  }).onError((e) {
    log('streamGenerateContent exception', error: e);
  });
```


#### Text-and-image input

With Gemini's streamGenerateContent method, you can seamlessly combine image selection and text input to receive dynamic, AI-generated content in real-time.
This integration ensures that your application can process and respond to complex inputs efficiently, providing users with accurate and contextual responses based on both text and image data.


```dart
final gemini = Gemini.instance;

gemini.streamGenerateContent('Select image of your chioce and type something')
  .listen((value) {
    log(value.output);
  }).onError((e) {
    log('streamGenerateContent exception', error: e);
  });
```

## Advanced Usage

#### Text-to-speech

Using the flutter_tts package, you can easily start and stop text-to-speech functionality in your Flutter app.
Here's how you can use the provided functions to speak and stop speech.

```dart
import 'package:flutter_tts/flutter_tts.dart';

FlutterTts flutterTts = FlutterTts();

  Future speak(String data) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(data);
 }

Future stop() async {
    await flutterTts.stop();
  }
```

#### Speech-to-text

Using the speech_to_text package, the provided code demonstrates how to start and stop speech recognition in a Flutter app.
The listen function initializes the speech recognizer, starts listening for speech input, and prints the recognized words or any errors to the console.

```dart
import 'package:speech_to_text/speech_to_text.dart' as stt;

 stt.SpeechToText? speech = stt.SpeechToText();
 void listen() async {
    speech = stt.SpeechToText();
    update();
    if (!isListening) {
      await speech!.initialize(
        onStatus: (val) {
          print('onStatus: $val');
        },
        onError: (val) {
          print('onError: $val');
        },
      );
        speech!.listen(
          onResult: (val) {
            print("Recognized words: ${val.recognizedWords}"); },
        );
     
    } else {
      showTopToast(context: Get.context!, msg: "Stop listening...");
      speech?.stop();
    }
  }
```

#### Dark-light theme

ThemeController in Flutter using GetX for state management, which allows toggling between dark and light themes.
The current theme is determined by the isDarkMode observable variable, and toggleTheme switches the theme mode accordingly.

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;


  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(theme);
  }
}
```

#### Custom gallery

Fetch a list of image assets from the device's photo gallery using the photo_manager package for it.
It retrieves a list of asset paths and then fetches the images from the first path in a paginated manner.

```dart
import 'package:photo_manager/photo_manager.dart';

  final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
        onlyAll: true,
        filterOption: _filterOptionGroup,
        type: RequestType.image,
      );
 final List<AssetEntity> entities = await paths.first.getAssetListPaged(
        page: pageNo,
        size: sizePerPage,
      );    
```

## gemini-widget

The GeminiResponseTypeView widget is designed to handle and display different states of a response (e.g., loading or loaded) from the Gemini API.
When the loading state is true, it returns a loading widget, and when the response is available, it displays the desired widget based on the response content.

```dart
 GeminiResponseTypeView(
    builder: (context, child, response, loading) {
          if (loading) {
                return widget; }
            if (response != null) {
                return widget;
         }}),
```

![download-compresskaru com 6 39 34 PM](https://github.com/user-attachments/assets/f6996371-ddc2-4d71-9fea-5c386e1dcbe0) ![download-compresskaru com 6 07 50 PM](https://github.com/user-attachments/assets/26958719-08af-4578-9ff8-f56d4820a74b) ![download-compresskaru com 6 07 38 PM](https://github.com/user-attachments/assets/ece71fcc-e99c-44a5-a623-5e6859991acc)

![download-compresskaru com (2)](https://github.com/user-attachments/assets/2e6e10e1-aa8f-4282-9ebd-84654eed97a9) ![download-compresskaru com 6 02 33 PM](https://github.com/user-attachments/assets/24fd2aed-327f-49d0-9db0-cf897b17f5cc) ![download-compresskaru com](https://github.com/user-attachments/assets/2e2e8297-0b0c-4dc5-b0d5-e869b0825f47)



This version includes all necessary information and code snippets for your AI-Chat app, presented in a clear and organized manner.