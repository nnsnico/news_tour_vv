module news

pub struct Response {
pub:
	status        string
	total_results int        [json: totalResults]
	articles      []Articles
}

pub struct Articles {
pub:
	source       Source
	author       string
	title        string
	description  string
	url          string
	url_to_image string [json: urlToImage]
	published_at string [json: publishedAt]
	content      string
}

pub struct Source {
pub:
	id   int
	name string
}
