module main

import os
import api.news
import api.slack

fn main() {
	news_api_key := os.getenv_opt('NEWS_API_KEY') or {
		eprintln('Not found News API Key')
		exit(1)
	}
	slack_api_key := os.getenv_opt('SLACK_API_KEY') or {
		eprintln('Not found Slack API Key')
		exit(1)
	}

	repo := Repository{
		news_api: news.Api{}
		slack_api: slack.Api{}
	}

	top_headline := repo.get_top_headline(news.Request{
		api_key: news_api_key
	})!

	repo.post_message(slack.Request{
		api_key: slack_api_key,
		channel: '#news'
		text: top_headline.to_string()
	})!

	println('Success!')
}
