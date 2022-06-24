<h3  align="center">

<br>

<p align="center">
<img src="https://user-images.githubusercontent.com/1754676/82777559-18537280-9e6c-11ea-9257-0a24645c91b0.png"  alt="Blobs"></p>

</h3>

<h4  align="center">Create beautiful blob shapes with minimal code. </h4>

### Features

- Generate blob in any size

- Control the randomness and complexity

- Animate the blob

- Set ID for a fixed blob

- Shuffle between the fixed blobs

- Loop animation

- Blob clipper

- Get SVG path

- Debug, Child widget, controller and few more

&nbsp;

<div class="highlight highlight-source-shell">
<pre>
<div align="center"><strong >Blobs App</strong></div>
<div align="center"><a align="center" href="https://lokesh-coder.github.io/blobs.app">https://lokesh-coder.github.io/blobs.app</a></div>
</pre>
</div>

&nbsp;

### Contents

- [Widgets](#widgets)

- [Clipper](#clipper)

- [Service](#service)

- [Inspirations](#inspirations)

&nbsp;

### Widgets

There are four widgets,

- `Blob.random()` - Generate random blobs

- `Blob.animatedRandom()` - Generate blobs and animate the shape change

- `Blob.fromID()` - Use one or more ID's for fixed blobs

- `Blob.animatedFromID()` - Animate the shape change

  &nbsp;

<img width="200" alt="basic_blobs" src="https://user-images.githubusercontent.com/1754676/82777156-eee61700-9e6a-11ea-9834-18882991056b.png">

&nbsp;

#### ⚙️ Blob Size

Size of the blob (_mandatory_).

```dart

Blob.random(size:200),

```

&nbsp;

#### ⚙️ Customise shape

`edgesCount` is the nodes count. More the value, more the complexity. Minimum is _3_ and max is _300_. But for cool shapes you can stick between _3-20_. Default is _7_

`minGrowth` is the minimum size of the blob. Smaller the value, more the randomness. Value should be an interger between _2-9_. Default is _4_.

```dart

Blob.random(
 size:200,
 edgesCount:5,
 minGrowth:4,
),

```

&nbsp;

#### ⚙️ Controller

You can use `BlobController`, if you want to change the shape programatically. As o now it has only one method called `change()`. When you call this, the shape will be changed and returns some useful info of the blob (`BlobData`).

```dart

BlobController blobCtrl =  BlobController();

```

```dart

Blob.random(
 size:200,
 edgesCount:5,
 minGrowth:4,
 controller: blobCtrl,
),

```

```dart

BlobData blobData = blobCtrl.change();

```

&nbsp;

#### ⚙️ Fixed shapes

In most scenarios you wanted a same blob to be rendered every time. This can be achieved using ID. It is just a plain string contains the shape data.

You can get the ID from the `blobData` from the controller's `change()` method. Or you can also generate blobs and get ID from [https://blobs.app/](https://blobs.app/)

ID looks like **`5-6-43178`**

`id` option accepts one or multiple id's. If it has only one id, then it will be a fixed blob.

```dart

Blob.fromID(
 size:200,
 id:['X-Y-ZZZZ'],
 controller: blobCtrl,
),

```

If you provide multiple id's, then it will show each one in order on changing.

```dart

Blob.fromID(
 size:200,
 id:['X-Y-ZZZZ','X-Y-ZZZZ','X-Y-ZZZZ'],
 controller: blobCtrl
),

```

&nbsp;

#### ⚙️ Styles

You can change the color, add gradient, make outlined using `BlobStyles()`

```dart

Blob.random(
 size:200,
 styles:  BlobStyles(
   color:  Colors.green,
   fillType:  BlobFillType.stroke,
   gradient:  LinearGradient(),
   strokeWidth:3,
 ),
),

```

Gradient can be Linear or Radial. `LinearGradient` will look like this,

```dart

LinearGradient(colors: [Colors.red, Colors.green])
.createShader(Rect.fromLTRB(0, 0, 300, 300))

```

<p float="left">
  <img width="200" alt="style_gradient" src="https://user-images.githubusercontent.com/1754676/82777164-f1e10780-9e6a-11ea-8d02-89217cd6e582.png">
  <img width="200" alt="style_custom_color" src="https://user-images.githubusercontent.com/1754676/82777162-f1e10780-9e6a-11ea-82ec-577210004e11.png">
  <img width="200" alt="style_outline" src="https://user-images.githubusercontent.com/1754676/82777165-f2799e00-9e6a-11ea-9166-3c4b5e0a82db.png">
</p>

&nbsp;

#### ⚙️ Child Widget

You can use `child` property to display a child which looks like the blob as background.

```dart

Blob.random(
 size:200,
 child:  Text('I am a child!'),
),

```

<img width="200" alt="blobs_with_child" src="https://user-images.githubusercontent.com/1754676/82777157-ef7ead80-9e6a-11ea-9b74-6224cf33d739.png">

&nbsp;

#### ⚙️ Animating the blobs

Whenever the blobs are changing, this widget will animate the shape change.

```dart

Blob.animatedRandom(
 size:200,
 edgesCount:5,
 minGrowth:4,
 duration:  Duration(milliseconds:500),
),

```

`duration` is optional. Default is `500` milliseconds.

![animated_basic](https://user-images.githubusercontent.com/1754676/82777008-6ebfb180-9e6a-11ea-9b85-fcac09cfca38.gif)

&nbsp;

#### ⚙️ Change shapes automatically

When you want to change the shapes automatically you can set `loop` property to true.

```dart

Blob.animatedRandom(
 size:200,
 edgesCount:5,
 minGrowth:4,
 loop:  true,
),

```

&nbsp;

#### ⚙️ Animate Fixed shapes

If you use `loop` in `Blob.fromAnimatedID()` widget, it will change shapes within the provided blobs.

```dart

Blob.animatedFromID(
 size:200,
 id:['X-Y-ZZZZ','X-Y-ZZZZ','X-Y-ZZZZ'],
 loop:  true,
),

```

![animated_fixed_blobs](https://user-images.githubusercontent.com/1754676/82777014-741cfc00-9e6a-11ea-8e75-80849b8dbf3b.gif)

&nbsp;

#### ⚙️ Debug

When you set `debug` to true, it will show you circles and lines that connect the blob points.

```dart

Blob.random(
 size:200,
 debug:  true,
),

```

<img width="200" alt="debug_blob" src="https://user-images.githubusercontent.com/1754676/82777158-f0afda80-9e6a-11ea-8dbf-84d774c42215.png">

&nbsp;

### Clipper

Sometime you might want to clip the widget by blob shape. In such cases you can use `BlobClipper()`. You can either provide `id` or `edgesCount` and `minGrowth` options.

```dart

Container(
 child:  ClipPath(
  clipper: BlobClipper(<OPTIONS>),
  child: Image.network("https://bit.ly/2nirIxg"),
 ),
)

```

![clipper](https://user-images.githubusercontent.com/1754676/82777018-75e6bf80-9e6a-11ea-913d-873e9ba4444c.gif)

&nbsp;

### Service

Blobs shape are created by `BlobGenerator()`. Both widgets and clipper uses this internally to create the shape and then it is painted to canvas. This will return `BlobData`.

```dart

BlobData blobData =  BlobGenerator(
 edgesCount:  7,
 minGrowth:  4,
 size:  Size(30, 30),
 id:  null,
).generate();

```

&nbsp;

#### ℹ️ BlobData

It is the raw data, which contains the path definitions, coordinates and other basic info about the blob.

```dart

BlobData(
 dots,
 innerRad,
 svgPath,
 coords,
 id,
 edgesCount,
 minGrowth,
 size,
 originalSize,
)

```

&nbsp;

#### 📐SVG

BlobData contains `svgPath` info. It is just a path string which will look like this,

`M326.0,251.5Q282.0,303.0,226.5,315.0Q171.0,327.0,118.5,296.0Q66.0,265.0,90.0,211.5Q114.0,158.0,145.0,126.0Q176.0,94.0,228.5,96.0Q281.0,98.0,325.5,149.0Q370.0,200.0,326.0,251.5Z`

from this you can easily create SVG like

```svg

<svg viewBox="0 0 400 400" xmlns="http://www.w3.org/2000/svg">
 <path fill="#474787" d="M326.0,251.5Q282.0,303.0,226.5,315.0Q171.0,327.0,118.5,296.0Q66.0,265.0,90.0,211.5Q114.0,158.0,145.0,126.0Q176.0,94.0,228.5,96.0Q281.0,98.0,325.5,149.0Q370.0,200.0,326.0,251.5Z" />
</svg>

```

### Inspirations

We can create cool visual elements with blobs. Here's a few things that came to my mind.

![ins#1](https://user-images.githubusercontent.com/1754676/82777020-767f5600-9e6a-11ea-9e3a-7fae7c47e595.gif)
<img width="200" alt="ins#2" src="https://user-images.githubusercontent.com/1754676/82777161-f1487100-9e6a-11ea-8364-3f8de4849bfd.png">
<img width="200" alt="#ins3" src="https://user-images.githubusercontent.com/1754676/82777152-eb529000-9e6a-11ea-923f-2df50eb0fa61.png">

### License

This project is licensed under MIT.

### Contribution and issue

Any kind of contributions are welcome :)

For any issues and suggestions please create a [issue card](https://github.com/lokesh-coder/flutter_blobs/issues/new) in Github repository
