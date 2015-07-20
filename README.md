## Wild Life Tracker

This Ruby on Rails app is built to allow users to input species and their sightings around their town.  It features location based filtering, devise with omniauth and a bin packing grid with packery.

## Prerequisites
- Rails 4
- sqlite3

## Getting Started

        # Get the latest
        git clone https://github.com/trodrigu/wild_life_tracker.git

        cd wild_life_tracker

        # Install gem dependencies
        bundle install

        # Create and migrate the database
        rake db:create
        rake db:migrate
        rake db:seed

        # Run server
        rails s

##License

The MIT License (MIT)

Copyright (c) 2015 Barter

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

