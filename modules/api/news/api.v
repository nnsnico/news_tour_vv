module news

import net.http
import json

const base_url = 'https://newsapi.org'

pub struct Api {}

pub fn (api Api) get_top_headlines(req Request) !Response {
	resp := http.get('${news.base_url}/v2/top-headlines?${req.to_query_values()}')!
	r := json.decode(Response, resp.body)!
	return r
}
