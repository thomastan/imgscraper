# imgscraper

Crawl a website and scrape its images into a page of thumbnails.


## How to use

Input:

```bash
./imgscraper.sh [OPTION] [website-url]
```
The one option that may be specified (or omitted) is the recursion depth of the page to crawl.  If omitted, the default depth is 4.

Output:

```
<html>
<body>

<img src="http://www.gstatic.com/webp/gallery/1.jpg" width="25%" />
<img src="http://www.gstatic.com/webp/gallery/2.jpg" width="25%" />
<img src="http://www.gstatic.com/webp/gallery/3.jpg" width="25%" />

</body>
</html>
```

## Requirements

- bash