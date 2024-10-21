var fs = require('fs');
var httpProxy = require('http-proxy');
var https = require('https');

var options = {
    cert: fs.readFileSync(".tmp/registry.localhost.com.pem"),
    key: fs.readFileSync(".tmp/registry.localhost.com-key.pem"),
};
var proxy = httpProxy.createProxyServer({});

https.createServer(options, function (req, res) {
    res.writeHead(200);
    if( req.url == "/" ) {
        proxy.web(req, res, {
            // TODO read from ENV VAR
            target: 'http://registry.localhost.com:3000'
        });
    } else if( req.url == "/tls/health" ) {
        res.end("localhost TLS encryption working as expected.\n");
    } else if( req.url == "/node/health" ) {
        res.end("localhost Node webserver working as expected.\n");
    } else if( req.url == "/citizen/health" ) {
        // better way to handle preventing the url path from being post-fixed to the target domain?
        req.url = ""
        proxy.web(req, res, {
            target: "http://registry.localhost.com:3000/health"
        });
    } else {
        res.end("Endpoint not found.\n");
    }
}).listen(443)
