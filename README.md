A Flutter Marquee list widget to display a list of items in
a [marquee style](https://en.wikipedia.org/wiki/Marquee_element).

![marquee_list_showcase](https://github.com/burhanrashid52/marquee_list/assets/14251963/9da1ed13-86a5-4761-b97d-23a4b693b8b3)


## Features

Use this widget in your Flutter app to:

- Scroll a list of items horizontally or vertically by defining `scrollDirection`.
- Customize the scrolling speed using `scrollDuration`.

## Usage
### Scroll horizontally
```dart
import 'package:marquee_list/marquee_list.dart';

//....
   child: MarqueeList(
     scrollDirection: Axis.horizontal, // By default, it's horizontal
     children: [
       Text("Text 1"),
       Text("Text 2"),
       Text("Text 3"),
       Text("Text 4"),
     ],
   ),
//....
```
### Scroll vertically
```dart
import 'package:marquee_list/marquee_list.dart';

//....
   child: MarqueeList(
     scrollDirection: Axis.vertical, // Change direction to vertical
     children: [
       Text("Text 1"),
       Text("Text 2"),
       Text("Text 3"),
       Text("Text 4"),
     ],
   ),
//....
```
### Customize the scrolling speed
```dart
import 'package:marquee_list/marquee_list.dart';

//....
   child: MarqueeList(
     scrollDuration: const Duration(seconds: 3), // Default is 1 second
     children: [
       Text("Text 1"),
       Text("Text 2"),
       Text("Text 3"),
       Text("Text 4"),
     ],
   ),
//....
```
### Receive call back when scroll ends using `onScrollEnd` callback
```dart
import 'package:marquee_list/marquee_list.dart';

//....
   child: MarqueeList(
     scrollDirection: Axis.horizontal,
     onScrollEnd: () {
       // Do something when the scroll ends
     },
     children: [
       Text("Text 1"),
       Text("Text 2"),
       Text("Text 3"),
       Text("Text 4"),
     ],
   ),
//....
```

## Contributing to this package
Contributions are welcome! Here is a curated list of how you can help:

- Report bugs and scenarios that are difficult to implement 
- Report parts of the documentation that are unclear 
- Fix typos/grammar mistakes 
- Update the documentation or add examples 
- Implement new features by making a pull-request

## MIT License

Copyright (c) 2024 Burhanuddin Rashid

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

