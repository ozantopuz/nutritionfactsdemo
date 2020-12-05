# 🔥 NutritionFacts

A new Flutter application using BLOC pattern.

![ic_launcher](https://user-images.githubusercontent.com/8689604/100318984-0051dc80-2fd0-11eb-8229-dbbaabae1873.png)

<br></br>

## ▶️ Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<br></br>

## 📱 iOS Screenshots

List             |  Detail
:-------------------------:|:-------------------------:
<img src="https://user-images.githubusercontent.com/8689604/100271856-3b6df480-2f6b-11eb-94f5-744442a1ab04.png" height="750">  |  <img src="https://user-images.githubusercontent.com/8689604/100272001-7839eb80-2f6b-11eb-9206-2018cbee9b60.png" height="750">

<br></br>

## 📱 Android Screenshots

List            |  Detail
:-------------------------:|:-------------------------:
<img src="https://user-images.githubusercontent.com/8689604/100271943-5ccee080-2f6b-11eb-920a-9f78f4e93eb5.png" height="750">  |  <img src="https://user-images.githubusercontent.com/8689604/100272041-85ef7100-2f6b-11eb-873f-858bb4747ebe.png" height="750">

<br></br>

## 📚 Tech Stack

-   [Dart](https://dart.dev/) - Dart is a client-optimized programming language for apps on multiple platforms.

-   [BLoC Architecture](https://medium.com/flutter-community/bloc-architecture-why-so-important-d9b29f06680e) - Its a state management system for Flutter recommended by Google developers. It helps in managing state and make access to data from a central place in your project.

-   [RxDart](https://pub.dev/packages/rxdart) - RxDart is an implementation of the popular reactiveX api for asynchronous programming, leveraging the native Dart Streams api.

<br></br>

## 🛠 Architecture

The Business Logic Component (BLoC) pattern is a pattern created by Google and announced at Google I/O ’18. The BLoC pattern uses Reactive Programming to handle the flow of data within an app.

A BLoC stands as a middleman between a source of data in your app (e.g an API response) and widgets that need the data. It receives streams of events/data from the source, handles any required business logic and publishes streams of data changes to widgets that are interested in them.

A BLoC has two simple components: Sinks and Streams, both of which are provided by a StreamController. You add streams of event/data input into a Sink and listen to them as streams of data output through a Stream.

A StreamController can be accessed via the ```dart:async``` library or as a ```PublishSubject```, ```ReplaySubject``` or ```BehaviourSubject``` via the rxdart package.

<img src="https://user-images.githubusercontent.com/8689604/100281690-6ceebc00-2f7b-11eb-9a94-eedca4ff6f78.png">

<br></br>

## 🔑 Configuration

In order to run this project, you need to get a **API-key** from  [FoodData Central](https://fdc.nal.usda.gov/). Set this key to the constant ```API_KEY``` in ```constants.dart``` to run the app.

<br></br>

## ⬇️ Download

<p align="center">
    <a href="https://play.google.com/store/apps/details?id=co.app.nutritionfacts" target="_blank"><img width="250" alt="Android" src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg"></a> &nbsp;&nbsp;&nbsp;  <a href="https://apps.apple.com/us/app/nutritionfacts-find-facts/id1542515633" target="_blank"><img width="250" alt="iOS" src="https://upload.wikimedia.org/wikipedia/commons/3/3c/Download_on_the_App_Store_Badge.svg"></a>
</p>

<br></br>

### 📃 License
```
Copyright 2020 ozantopuz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


