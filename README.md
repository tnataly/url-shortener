# URL shortener


###:star: Features:
- [x] User enters the URL of source and gets the shorturl.
- [x] Server provides redirect to source of the shorturl.
- [x] Shorturl format: `base_url + slug`. Slug contains letters and digits excluding the ambiguous characters.
- [x] History of url shrinks is provided during user session.
- [x] Shorturl clicks counter.
- [x] Additional information about shrinked url is provided: Website title, number of clicks and date of creation

### Technologies:
- Ruby 2.2.2, Rails 4.2.0
- PostgreSQL
- Bootstrap
- Nokogiri to grab a website title
- RSpec, Shoulda Matchers

### Tests:
Run the test suite with `rake` or `rspec spec`



-----------
###:octocat: "Someday maybe" features:
- [ ] Add url validation
- [ ] Add "copy to clipboard" for shorturl
- [ ] Add website shapshots

### :hash: All contributors are welcomed
* Fork it ( `https://github.com/tnataly/url-shortener/fork` )
* Create your feature branch (`git checkout -b my-new-feature`)
* Commit your changes (`git commit -am 'Add some feature')
* Push to the branch (`git push origin my-new-feature`)
* Create a new Pull Request

