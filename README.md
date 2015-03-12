bashlive.webpipes.coffeescript.nodejs
=====================================

Example coffeescript webpipe 

# Lets run the webpipe 

coffeescript:

    $ ./webpipe.coffee 
    webpipe 'foo' listening on 0.0.0.0:3000

or nodejs:

    $ node webpipe.js
    webpipe 'foo' listening on 0.0.0.0:3000

# Lets test it using a webpipe client 

For convenience we use the [webpipe.bash](http://webpipe.bashlive.com) webpipe-client

    $ webpipe::set webpipe http://localhost:3000/foo
    $ webpipe::list
      xpath                 -> http://neon-biop-490.appspot.com/xpath
      markdown              -> http://neon-biop-490.appspot.com/markdown
      jsonpath              -> http://neon-biop-490.appspot.com/jsonpath
      cssselect             -> http://neon-biop-490.appspot.com/cssselect
      csv2json              -> http://neon-biop-490.appspot.com/csv2json
      url2html              -> http://neon-biop-490.appspot.com/url2html
      xml2json              -> http://neon-biop-490.appspot.com/xml2json
      foo                   -> http://localhost:3000/foo                    <-- voila!
      json2csv              -> http://neon-biop-490.appspot.com/json2csv
      json_print_r          -> http://neon-biop-490.appspot.com/json_print_r
      striphtml             -> http://neon-biop-490.appspot.com/striphtml

# Now we can run it:

    $ foo
    Usage: echo 'foo' | webpipe [options] 
     
    This is a sample webpipe in coffeescript

    $ echo "flop" | foo one two
    received: flop {"1":"one","2":"two"}

# More 

For more info on webpipes see [webpipe.bashlive.com](http://webpipe.bashlive.com)
