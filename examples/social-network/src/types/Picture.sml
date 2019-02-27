type SocialNetwork::Picture

use {
	"std" 1.0
}

value struct {
	format PictureFormat
	size   PictureSize
	file   Binary
}
