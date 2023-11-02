# jekyll-thumbnail-img
A Jekyll plugin to generate image thumbnails with specified width.

# Installation
Add the following to your `Gemfile`:
```
gem 'jekyll-thumbnail-img'
```

# Usage
The plugin provides a Liquid filter `thumbnail_img` as follows:
```
{% thumbnail_img <path to image> <width in pixels> %}
```
For example:
```
{% thumbnail_img path/to/image.jpg 500 %}
```
This will generate a thumbnail of width 500px with the same aspect ratio as the original image in the directory `path/to/thumbnails` with the name `image_500w.jpg`.
