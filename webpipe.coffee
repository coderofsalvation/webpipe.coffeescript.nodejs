#!/usr/bin/env coffee
# vim:ft=coffee ts=2 sw=2 et :
# -*- mode:coffee -*-

request    = require("request");
express    = require("express")

app        = express()
bodyParser = require('body-parser')
port       = process.env.PORT or 3000
ip         = process.env.IP   or '0.0.0.0'
name       = "foo"
 
usage = "Usage: echo 'foo' | webpipe [options] \n
                                               \n    
This is a sample webpipe in coffeescript       \n
"

app.use bodyParser.json()                           # for parsing application/json
app.use bodyParser.urlencoded({ extended: true })   # for parsing application/x-www-form-urlencoded
app.use (req, res, next) ->                         # for parsing raw body 
  data = ''
  req.setEncoding 'utf8'
  req.on 'data', (chunk) ->
    data += chunk
    return
  req.on 'end', ->
    req.body = data
    next()
    return
  return

# the url handlers

app.get '/'+name, (req, res) ->
  res.send usage

app.options '/'+name, (req, res) ->
  res.send usage 

app.post '/'+name, (req, res) ->
  response = req.body 
  response = JSON.stringify( {"received":req.body} ) if req.header("Content-Type")?.match("application/json")
  res.send "received: "+response+" "+ JSON.stringify(req.query)

console.log " webpipe '"+name+"' listening on "+ip+":"+port
app.listen port, ip
