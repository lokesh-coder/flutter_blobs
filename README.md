<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/blobs-logo.png" alt="Blobs" width="100"><br>
</h1>

<h4 align="center">Create beautiful blob shapes with minimal code. Includes widgets, animations, clipper and services.</h4>

# Blobs

Blobs can be created from widgets, clippers and services.

## Features

- Generate blob in any size
- Control the edges and complexity
- Animate the blob
- Set hash ID for a fixed blob
- Shuffle between the fixed blobs
- Loop animation
- Custom clipper
- Get SVG path
- Debug, child, controller and few more

## Contents

- [Widgets](#widgets)
- [Clipper](#clipper)
- [Service](#service)

### Widgets

There are four widgets,

- `Blob.random()` - Generate random blobs
- `Blob.animatedRandom()` - Generate blobs and animate the shape change
- `Blob.fromHash()` - Use one or more hash ID's for fixed blobs
- `Blob.animatedFromHash()` - Animate the shape change

Blobs and animations are configurable.

&nbsp;

> #### Blob Size

Size of the blob. It is mandatory.

```dart
Blob.random(size:200),
```

![Basic blob](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/blob_shape_2.jpg)

&nbsp;

> #### Blob shape settings

`edgesCount` is the nodes count. Minimum is _3_ and max is _300_. But for cool shapes you can stick between _3-20_. Default is _7_
`minGrowth` is the minimum size of the blob. Value should be an interger between _2-9_. Default is _4_.

```dart
Blob.random(
  size:200,
  edgesCount:5,
  minGrowth:4,
),
```

![Basic blob](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/blob_shape_1.jpg)
![Basic blob](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/blob_shape_3.jpg)
![Basic blob](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/blob_shape_4.jpg)

&nbsp;

> #### Controller

You can use `BlobController`, if you want to change the shape programatically. As of. now it has only one method called `change()`. When you call this, the shape will be changed and returns some useful data of the blob (`BlobData`).

```dart
BlobConroller blobCtrl = BlobController();
```

```dart
Blob.random(
  size:200,
  edgesCount:5,
  minGrowth:4,
  controller: blobCtrl
),
```

```dart
BlobData blobData = blobCtrl.change();
```

&nbsp;

> #### Fixed shapes

In most scenarios you wanted a same blob to be loaded every time. This can be achieved using hash. Hash is just a ID, which contains the shape data. You can get the hash id from the `blobData` from the controller's `change()` method.

Blobs app is in progress. Once it is ready, you will be able to generate and get the hash ID from that app.

Hash id looks like `H4sIANhSwV4A/w3LsQ0AMQgEwYY24A5koBbr+2/jnY40NzdxBD7GPagXrznzKKlFbjSBJDKKs9QLE98PNkNQxj0AAAA=`

`hash` option accepts one or multiple id's. If it has only one hash, then it will be a fixed blob.

```dart
Blob.fromHash(
  size:200,
  hash:['XXXXXXXX...'],
  controller: blobCtrl
),
```

If you provide multiple id's, then it will show each one in order on changing.

```dart
Blob.fromHash(
  size:200,
  hash:['XXXXXXXX...','YYYYYYY....','ZZZZZZZZ....'],
  controller: blobCtrl
),
```

&nbsp;

> #### Styles

You can change the color, add gradient, make outlined using `BlobStyles()`

```dart
Blob.random(
  size:200,
  styles: BlobStyles(
    color: Colors.green,
    fillType: BlobFillType.stroke,
    gradient: LinearGradient(),
    strokeWidth:3,
  ),
),
```

![Custom color](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/color.jpg)

Gradient can be Linear or Radial. `LinearGradient` will look like this,

```dart
LinearGradient(colors: [Colors.red, Colors.green])
.createShader(Rect.fromLTRB(0, 0, 300, 300))
```

![Basic blob](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/gradient.jpg)
![Basic blob](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/stroke.jpg)

&nbsp;

> #### Child Widget

You can use `child` property to display a child which looks like the blob as background.

```dart
Blob.random(
  size:200,
  child: Text('I am a child!'),
),
```

![Child](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/child.jpg)

&nbsp;

> #### Animating the blobs

Whenever the blobs are changing, this widget will animate the shape change.

```dart
Blob.animatedRandom(
  size:200,
  edgesCount:5,
  minGrowth:4,
  duration: Duration(milliseconds:500)
),
```

`duration` is optional. Default is `500` milliseconds.

![Animation](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/basic_animation.gif)

&nbsp;

> #### Change shapes automatically

When you want to change the shapes automatically you can set `loop` to true.

```dart
Blob.animatedRandom(
  size:200,
  edgesCount:5,
  minGrowth:4,
  loop: true,
),
```

![Animation](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/loop.gif)

&nbsp;

> #### Animate Fixed shapes

If you use `loop` in `Blob.fromAnimatedHash()` widget, it will change shapes within the provided blobs.

```dart
Blob.animatedFromHash(
  size:200,
  hash:['XXXXXXXX...','YYYYYYY....','ZZZZZZZZ....'],
  loop: true,
),
```

![Animate fixed blobs](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/multiple_hash.gif)

&nbsp;

> #### Debug

When you set `debug` to true, it will show you circles and lines that connect the blob points.

```dart
Blob.random(
  size:200,
  debug: true,
),
```

![Debug](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/debug.jpg)

&nbsp;

### Clipper

Sometime you. might want to clip the widget by blob shape. In such cases you can use `BlobClipper()`. You can either provide `hash` or `edgesCount` and `minGrowth` options.

```dart
Container(
	child: ClipPath(
        clipper: BlobClipper(<OPTIONS>),
        child: new Image.network("https://bit.ly/2nirIxg"),
      ),
)
```

![Clipper](https://raw.githubusercontent.com/lokesh-coder/flutter_blobs/develop/screenshots/clip.gif)

&nbsp;

### Service

Blobs shape are created by `BlobGenerator()`. Both widgets and clipper uses this internally to create the shape and then it is painted to canvas. This will return `BlobData`.

```dart

BlobData blobData =  BlobGenerator(
  edgesCount: 7,
  minGrowth: 4,
  size: Size(30, 30),
  hash: null,
).generate();

```

&nbsp;

> #### BlobData

It is the raw data, which contains the path definitions, coordinates and other basic info about the blob.

```dart
BlobData(
  dots,
  innerRad,
  svgPath,
  coords,
  hash,
  edgesCount,
  minGrowth,
  size,
  originalSize,
)
```

&nbsp;

> #### SVG

BlobData contains `svgPath` info. It is just a path string which will look like this,

`M326.0,251.5Q282.0,303.0,226.5,315.0Q171.0,327.0,118.5,296.0Q66.0,265.0,90.0,211.5Q114.0,158.0,145.0,126.0Q176.0,94.0,228.5,96.0Q281.0,98.0,325.5,149.0Q370.0,200.0,326.0,251.5Z`

from this you can easily create SVG like

```svg
<svg viewBox="0 0 400 400" xmlns="http://www.w3.org/2000/svg">
  <path fill="#474787" d="M326.0,251.5Q282.0,303.0,226.5,315.0Q171.0,327.0,118.5,296.0Q66.0,265.0,90.0,211.5Q114.0,158.0,145.0,126.0Q176.0,94.0,228.5,96.0Q281.0,98.0,325.5,149.0Q370.0,200.0,326.0,251.5Z" />
</svg>
```
