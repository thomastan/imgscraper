# imgscraper

Crawl a website and scrape its images into a page of thumbnails.


## How to use

Input:

```bash
./imgscrape.sh [OPTION] [website-url]
```

The (only) one option that may be specified (or omitted) is the recursion depth of the site to crawl.  If omitted, the default depth is 4.

Output:

```html
<html>
<body>

<img src="http://www.gstatic.com/webp/gallery/1.jpg" width="25%" />
<img src="http://www.gstatic.com/webp/gallery/2.jpg" width="25%" />
<img src="http://www.gstatic.com/webp/gallery/3.jpg" width="25%" />

</body>
</html>
```

Example:

```bash
./imgscrape.sh http://artificialworlds.net/wiki
```


## Requirements

- bash v4.0+ (associative array support is needed).
- Perl 5.x

OS X users: the default bash is version 3.2 (because of its non-GPLv3 license).  To install the GPLv3 licensed bash 4.x, run `brew install bash` in Terminal ([homebrew](http://brew.sh) required).

Windows users: install a (32-bit) [bash shell](https://github.com/git-for-windows/git/releases/latest) and [Perl](http://perl.org/get.html#win32) interpreter to meet the requirements.
