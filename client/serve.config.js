const config = require('./webpack.config')

module.exports = {
  ...config,
  mode: 'development',
  serve: {
    host: '0.0.0.0'
  }
}
