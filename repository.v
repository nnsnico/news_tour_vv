module main

import api.news
import api.slack
import net.http

pub struct Repository {
	news_api  news.Api  [required]
	slack_api slack.Api [required]
}

pub fn (repo Repository) get_top_headline(req news.Request) !TopHeadline {
	resp := repo.news_api.get_top_headlines(req)!
	// TODO: filtering website that want to ignore
	top_article := resp.articles[0]
	headline := TopHeadline{
		title: top_article.title
		description: top_article.description
		source_name: top_article.source.name
		url: top_article.url
		published_at: top_article.published_at
	}
	return headline
}

pub fn (repo Repository) post_message(req slack.Request) !http.Response {
	return repo.slack_api.post_message(req)
}
