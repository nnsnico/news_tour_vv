module main

pub struct TopHeadline {
	title        string
	description  string
	source_name  string
	url          string
	published_at string
}

pub fn (h TopHeadline) to_string() string {
	return '${h.title}\n${h.url}\n`Powered by News Api`'
}
