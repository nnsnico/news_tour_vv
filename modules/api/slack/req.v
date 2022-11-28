module slack

pub struct Request {
	api_key string [required; skip]
	channel string [required]
	text    string [required]
	as_user bool = true
}
