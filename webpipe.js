var app, bodyParser, express, ip, name, port, request, usage;

request = require("request");
express = require("express");
app = express();
bodyParser = require('body-parser');
port = process.env.PORT || 3000;
ip = process.env.IP || '0.0.0.0';
name = "foo";
usage = "Usage: echo 'foo' | webpipe [options] \n \n This is a sample webpipe in coffeescript       \n";

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(function(req, res, next) {
  var data;
  data = '';
  req.setEncoding('utf8');
  req.on('data', function(chunk) {
    data += chunk;
  });
  req.on('end', function() {
    req.body = data;
    next();
  });
});

app.get('/' + name, function(req, res) {
  return res.send(usage);
});

app.options('/' + name, function(req, res) {
  return res.send(usage);
});

app.post('/' + name, function(req, res) {
  var response, _ref;
  response = req.body;
  if ((_ref = req.header("Content-Type")) != null ? _ref.match("application/json") : void 0) {
    response = JSON.stringify({
      "received": req.body
    });
  }
  return res.send("received: " + response + " " + JSON.stringify(req.query));
});

console.log(" webpipe '" + name + "' listening on " + ip + ":" + port);

app.listen(port, ip);

