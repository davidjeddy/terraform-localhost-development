var fs = require('fs');
var httpProxy = require('http-proxy');
var https = require('https');

var options = {
    cert: fs.readFileSync(".tmp/localhost.pem"),
    key: fs.readFileSync(".tmp/localhost-key.pem"),
};
var proxy = httpProxy.createProxyServer({});

https.createServer(options, function (req, res) {
    res.writeHead(200);
    if( req.url == "/" ) {
        proxy.web(req, res, {
            target: 'http://localhost:3000'
        });
    } else if( req.url == "/tls/health" ) {
        res.end("localhost TLS encryption working as expected.\n");
    } else if( req.url == "/node/health" ) {
        res.end("localhost Node webserver working as expected.\n");
    } else if( req.url == "/citizen/health" ) {
        // better way to handle preventing the url path from being post-fixed to the target domain?
        req.url = ""
        proxy.web(req, res, {
            target: "http://localhost:3000/health"
        });
    } else {
        res.end("Endpoint not found.\n");
    }
}).listen(443)
