module slack

import net.http
import json

const base_url = 'https://slack.com/api'

pub struct Api {}

pub fn (api Api) post_message(req Request) !http.Response {
	req_json := json.encode(req)
	r := http.Request{
		method: http.Method.post
		header: http.new_header_from_map({
			http.CommonHeader.content_type: 'application/json; charset=utf-8',
			http.CommonHeader.authorization: 'Bearer ${req.api_key}'
		})
		data: req_json
		url: '${slack.base_url}/chat.postMessage'
	}
	resp := r.do()!
	return resp
}
