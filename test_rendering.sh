git clone https://gitlab.cern.ch/crizzi/jekyll-theme-chiara.git jekyll-theme-chiara
cd jekyll-theme-chiara 
rm -rf .git* .travis.yml README.md LICENSE.txt 
cd ../
mv -vn jekyll-theme-chiara/* .
rm -rf jekyll-theme-chiara
gem install bundler
bundle install
bundle exec jekyll serve --trace
