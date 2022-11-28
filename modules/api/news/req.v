module news

import net.urllib

pub struct Request {
	api_key   string   [required]
	country   string   = 'jp'
	category  Category = .technology
	page_size int      = 10
}

fn (r Request) to_query_values() string {
	mut v := urllib.new_values()
	v.set('apiKey', r.api_key)
	v.set('country', r.country)
	v.set('category', r.category.str())
	v.set('pageSize', r.page_size.str())
	return v.encode()
}

pub enum Category {
	business
	entertainment
	general
	health
	science
	sports
	technology
}
