mkdir localtestsite
cd localtestsite
for i in  _config.yml _start _triggerAPI images index.md start triggerAPI; do
    cp -r -f ../$i .
done
git clone https://gitlab.cern.ch/jmontejo/jekyll-theme-jmontejo.git jekyll-theme-jmontejo
cd jekyll-theme-jmontejo
rm -rf .git* .travis.yml README.md LICENSE.txt 
cd ../
mv -vn jekyll-theme-jmontejo/* .
rm -rf jekyll-theme-jmontejo
#gem install bundler
bundle install
bundle exec jekyll serve --trace
