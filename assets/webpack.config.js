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
    front: './js/front/app.js',
    admin: './js/admin/app.js',
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, '../priv/static/js/')
  },

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
      filename: "../css/[name]/app.css",
    }),

    new CopyWebpackPlugin([
      {
        from: 'static/',
        to: '../'
      },

      { from: '/home/nicolas/VANDENBOGAERDE_Nicolas/phoenix/la_potiniere/assets/js/vendors/ckeditor/',
        to: 'vendors/ckeditor/'
      },

      { from: '/home/nicolas/VANDENBOGAERDE_Nicolas/phoenix/la_potiniere/assets/js/vendors/lodash/',
        to: 'vendors/lodash/'
      },

      { from: '/home/nicolas/VANDENBOGAERDE_Nicolas/phoenix/la_potiniere/assets/js/vendors/jquery/',
        to: 'vendors/jquery/'
      },

      { from: '/home/nicolas/VANDENBOGAERDE_Nicolas/phoenix/la_potiniere/assets/fonts/',
        to: 'fonts/'
      },
    ]),
    /*new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery'
    }),*/
  ]
});
