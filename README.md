# ocr-xslt
XSLT functions to handle all common OCR formats

<!-- BEGIN-MARKDOWN-TOC -->
* [Shared concepts](#shared-concepts)
	* [OCR formats](#ocr-formats)
	* [Box coordinates](#box-coordinates)
* [Function reference](#function-reference)
	* [`ocr.bbox.xsl`](#ocrbboxxsl)
		* [`ocr:bbox($format, $element, $coord)`](#ocrbboxformat-element-coord)
		* [`ocr:hocr-bbox($element, $coord)`](#ocrhocr-bboxelement-coord)
		* [`ocr:alto-bbox($slement, $coord)`](#ocralto-bboxslement-coord)
	* [`ocr.image.xsl`](#ocrimagexsl)
		* [`ocr:image($format, $element)`](#ocrimageformat-element)
		* [`ocr:hocr-image($element)`](#ocrhocr-imageelement)

<!-- END-MARKDOWN-TOC -->

## Shared concepts

### OCR formats

* `hocr`
* `alto`

### Box coordinates

* `left`
* `right`
* `top`
* `bottom`
* `width`
* `height`

## Function reference

<!-- BEGIN-RENDER -ip '| \?' xsl-functions/ocr.bbox.xsl -->
### `ocr.bbox.xsl`

* [source](xsl-functions/ocr.bbox.xsl)

Retrieve the bounding box of an element


#### `ocr:bbox($format, $element, $coord)`

* `$format`: A valid [OCR format](#ocr-formats)
* `$element`: The element to bound
* `$coord`: A valid [box coordinate](#box-coordinates)


#### `ocr:hocr-bbox($element, $coord)`

* `$element`: The element to bound
* `$coord`: A valid [box coordinate](#box-coordinates)


#### `ocr:alto-bbox($slement, $coord)`

* `$element`: The element to bound
* `$coord`: A valid [box coordinate](#box-coordinates)

<!-- END-RENDER -->
<!-- BEGIN-RENDER -ip '| \?' xsl-functions/ocr.image.xsl -->
### `ocr.image.xsl`

* [source](xsl-functions/ocr.image.xsl)

Retrieve the image for an element


#### `ocr:image($format, $element)`

* `$format`: A valid [OCR format](#ocr-formats)
* `$element`: The element with image


#### `ocr:hocr-image($element)`

* `$element`: The element with image

<!-- END-RENDER -->
