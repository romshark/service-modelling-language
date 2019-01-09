model SocialNetwork

enum PictureFormat {
	Png
	Jpeg
	Tiff
	Gif
}

struct PictureSize {
	width  Uint32
	height Uint32
}

struct Picture {
	format PictureFormat
	size   PictureSize
	file   Binary
}
