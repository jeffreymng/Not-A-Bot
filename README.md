# README

Not-A-Bot is a web app which generates twitter bots from inputed twitter handles.

The app uses a Markov Chain on a twitter profile's tweet text, and Clarifai's image recognition with Google's Image Search API to build new tweets mimicking the style and content of the inputed Twitter User.

RoR, Materialize CSS Framework, Twitter API/oAuth, Clarifai Image recognition, and Google Image Search API.

* Ruby version - 2.2.5
* Rails version - 5.0.0.1


** To Run Locally **
	* System dependencies
		- see Gemfile for gem dependencies
		- you will also need to obtain a set of keys for the following:
			- Twitter oAuth (consumer_key, consumer_secret_key) *note: this also requires included Twitter Gem*
			- Clarifai API (CLARIFAI_CLIENT_ID, CLARIFAI_CLIENT_ID)
			- Google search API (GOOGLE_CUSTOM_SEARCH_KEY)

		- Setup a .env file using the dotenv gem and add your new API keys to your .env file as values set to the corosponding variable listed after in parenthisies above.

		ex: "GOOGLE_CUSTOM_SEARCH_KEY=your_new_google_search_API_key"

	* Database creation/setup
		- Postgresql (make sure postgresql is running locally as well)
		- in CL run "rails db:setup"

	* Start server
		- in CL run "rails s"

* Services (job queues, cache servers, search engines, etc.)
	- Puma for basic multithreading
	- minimal use of DB as most of the data aquasition is done through API calls.

more info on our implemtation of the Twitter api/oAuth:
https://gorails.com/episodes/omniauth-twitter-sign-in

dotenv notation/github:
https://github.com/bkeepers/dotenv
