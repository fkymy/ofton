## ofton-rails


## Ideas

### doctrine

http://rubyonrails.org/doctrine/

### ruby-style-guide

https://github.com/fortissimo1997/ruby-style-guide/blob/japanese/README.ja.md

### rails-style-guide

https://github.com/satour/rails-style-guide/blob/master/README-jaJA.md

### examples

https://github.com/discourse/discourse

https://github.com/diaspora/diaspora


## Conventions(Opinionated)
[wip]
v1

### models



### views



### controllers




## Installations

## バージョン

|key    |version |
|:-----:|:------:|
|ruby   | 2.3.1  |
|Rails  | 5.1.1  |
|bundler| 1.15.0 |
|node   | v7.0.0 |

### Xcode,Command Line Tools

```
xcode-select --install
```

### Homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### rbenv(for bash)

```
brew install rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
brew install ruby-build
brew install rbenv-gemset
brew install rbenv-gem-rehash
source ~/.bash_profile
```

### ruby2.3.1

```
rbenv install 2.3.1
rbenv rehash #今は必要ないらしい
rbenv global 2.3.1
```
or localで...

### bundler

```
gem install bundler --version=1.15.0
```

### rails

```
gem install rails
```

### npm

`ndenv`を各自install

```
ndenv install v7.0.0
ndenv local v7.0.0
npm install
```

## Database

https://github.com/yshkd/ofton-rails/issues/2

### Get on Rails
```
bin/bundle install --path vendor/bundle --jobs 4
bin/rails server
```
