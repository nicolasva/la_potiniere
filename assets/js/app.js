// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
//
//import "../node_modules/ckeditor/ckeditor.js"
//import 'jquery';
import "phoenix_html"
import "./vendors/scanjs/scan.js.coffee"
import "./admin/contents/form.js.coffee"
import "./admin/menus/index.js.coffee"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
