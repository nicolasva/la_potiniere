const path = require('path');
const webpack = require('webpack');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = (env, options) => ({
  plugins: {
    coffeescript: {
      bare: true
    }
  },
  optimization: {
    minimizer: [
      new UglifyJsPlugin({
        cache: true,
        parallel: true,
        sourceMap: false
      }),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
  entry: {
    admin: './js/admin/app.js',
    front: './js/front/app.js',
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, '../priv/static/js/')
  },

  /*entry: './js/app.js',
  output: {
    filename: 'app.js',
    path: path.resolve(__dirname, '../priv/static/js/')
  },*/

  /*entry: './js/vendors/lodash/lodash.js',
  output: {
    filename: 'lodash.js',
    path: path.resolve(__dirname, '../priv/static/js/vendors/lodash')
  },*/
  module: {
    rules: [{
        test: /\.coffee$/,
        use: {
          loader: 'coffee-loader',
          options: { sourceMap: true }
        }
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      },
      {
        test: /\.(css|sass|scss)$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: 'css-loader',
            options: {
              importLoaders: 2,
              sourceMap: true
            }
          },
          {
            loader: 'postcss-loader',
            options: {
              plugins: () => [
                require('autoprefixer')
              ],
              sourceMap: true
            }
          },
          {
            loader: 'sass-loader',
            options: {
              sourceMap: true
            }
          }
        ]
      },
      {
        test: /\.(woff(2)?|ttf|eot|svg)(\?v=\d+\.\d+\.\d+)?$/,
        use: [{
          loader: 'file-loader',
          options: {
            name: '[name].[ext]',
            outputPath: '../fonts'
          }
        }]
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: '../css/front/app.css'
    }),
    new MiniCssExtractPlugin({
      filename: '../css/admin/app.css'
    }),
    new CopyWebpackPlugin([{
      from: 'static/',
      to: '../'
    }]),
    /*new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery'
    }),*/
  ]
});
