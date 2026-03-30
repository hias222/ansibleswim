const NodeMediaServer = require('node-media-server');
const express = require('express');
const path = require('path');
const { createProxyMiddleware } = require('http-proxy-middleware');

// NodeMediaServer config
const config = {
  rtmp: {
    port: 1935,
    chunk_size: 60000,
    gop_cache: true,
    ping: 30,
    ping_timeout: 60
  },
  http: {
    port: 8000,
    allow_origin: '*'
  }
};

// Start NodeMediaServer
const nms = new NodeMediaServer(config);
nms.run();

// Express app for start page and API proxy
const app = express();
const publicDir = path.join(__dirname, 'public');
app.use(express.static(publicDir));
app.get('/', (req, res) => {
  res.sendFile(path.join(publicDir, 'index.html'));
});

// Proxy API requests to node-media-server
app.use('/api/streams', createProxyMiddleware({
  target: 'http://localhost:8000',
  changeOrigin: true,
  pathRewrite: { '^/api/streams': '/api/streams' },
}));

const EXPRESS_PORT = 8080;
app.listen(EXPRESS_PORT, () => {
  console.log(`Startpage available at http://localhost:${EXPRESS_PORT}/`);
});
