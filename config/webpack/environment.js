const { environment } = require('@rails/webpacker')

const webpack = require('webpack');
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    JSQR: ['jsqr']
  })
)
module.exports = environment
