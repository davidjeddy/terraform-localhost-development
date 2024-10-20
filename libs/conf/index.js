var fs = require('fs');
var httpProxy = require('http-proxy');
var https = require('https');

var proxy = httpProxy.createProxyServer({});

var options = {
    cert: fs.readFileSync(".tmp/localhost.pem"),
    key: fs.readFileSync(".tmp/localhost-key.pem"),
};

https.createServer(options, function (req, res) {
    // res.writeHead(200);
    // res.end("localhost TLS certificate working as expected.\n");
    proxy.web(req, res, {
        target: 'http://localhost:3000'
    });
}).listen(443)

// TODO redirect request to localhost:3000; where citizen
// TODO add request logging stdout / file
