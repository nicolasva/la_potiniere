/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./js/app.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "../deps/phoenix_html/priv/static/phoenix_html.js":
/*!********************************************************!*\
  !*** ../deps/phoenix_html/priv/static/phoenix_html.js ***!
  \********************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\n\n(function () {\n  var PolyfillEvent = eventConstructor();\n\n  function eventConstructor() {\n    if (typeof window.CustomEvent === \"function\") return window.CustomEvent; // IE<=9 Support\n\n    function CustomEvent(event, params) {\n      params = params || {\n        bubbles: false,\n        cancelable: false,\n        detail: undefined\n      };\n      var evt = document.createEvent('CustomEvent');\n      evt.initCustomEvent(event, params.bubbles, params.cancelable, params.detail);\n      return evt;\n    }\n\n    CustomEvent.prototype = window.Event.prototype;\n    return CustomEvent;\n  }\n\n  function buildHiddenInput(name, value) {\n    var input = document.createElement(\"input\");\n    input.type = \"hidden\";\n    input.name = name;\n    input.value = value;\n    return input;\n  }\n\n  function handleClick(element) {\n    var to = element.getAttribute(\"data-to\"),\n        method = buildHiddenInput(\"_method\", element.getAttribute(\"data-method\")),\n        csrf = buildHiddenInput(\"_csrf_token\", element.getAttribute(\"data-csrf\")),\n        form = document.createElement(\"form\"),\n        target = element.getAttribute(\"target\");\n    form.method = element.getAttribute(\"data-method\") === \"get\" ? \"get\" : \"post\";\n    form.action = to;\n    form.style.display = \"hidden\";\n    if (target) form.target = target;\n    form.appendChild(csrf);\n    form.appendChild(method);\n    document.body.appendChild(form);\n    form.submit();\n  }\n\n  window.addEventListener(\"click\", function (e) {\n    var element = e.target;\n\n    while (element && element.getAttribute) {\n      var phoenixLinkEvent = new PolyfillEvent('phoenix.link.click', {\n        \"bubbles\": true,\n        \"cancelable\": true\n      });\n\n      if (!element.dispatchEvent(phoenixLinkEvent)) {\n        e.preventDefault();\n        return false;\n      }\n\n      if (element.getAttribute(\"data-method\")) {\n        handleClick(element);\n        e.preventDefault();\n        return false;\n      } else {\n        element = element.parentNode;\n      }\n    }\n  }, false);\n  window.addEventListener('phoenix.link.click', function (e) {\n    var message = e.target.getAttribute(\"data-confirm\");\n\n    if (message && !window.confirm(message)) {\n      e.preventDefault();\n    }\n  }, false);\n})();\n\n//# sourceURL=webpack:///../deps/phoenix_html/priv/static/phoenix_html.js?");

/***/ }),

/***/ "./css/app.scss":
/*!**********************!*\
  !*** ./css/app.scss ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./css/app.scss?");

/***/ }),

/***/ "./js/admin/contents/form.js.coffee":
/*!******************************************!*\
  !*** ./js/admin/contents/form.js.coffee ***!
  \******************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("$(document).ready(function() {\n  //console.log(\"nicolas\")\n  if (\"#ckeditor_text\".length > 0) {\n    return CKEDITOR.replace('ckeditor_text', {\n      extraPlugins: 'imagebrowser',\n      imageBrowser_listUrl: '/ckeditor/ckeditorfiles',\n      //filebrowserBrowseUrl: '/ckeditor/ckeditorfiles',\n      filebrowserUploadUrl: '/ckeditor/ckeditorfiles'\n    });\n  }\n});\n\n\n//# sourceURL=webpack:///./js/admin/contents/form.js.coffee?");

/***/ }),

/***/ "./js/admin/menus/index.js.coffee":
/*!****************************************!*\
  !*** ./js/admin/menus/index.js.coffee ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("var get_id_for_sortable_item, get_id_sortable, get_menu_id, location_ajax;\n\njQuery(function() {\n  if (!location_ajax(window.location.href)) {\n    return get_id_for_sortable_item(window.location.href).sortable({\n      items: get_id_sortable(window.location.href),\n      update: function() {\n        return $.ajax({\n          url: location_ajax(window.location.href),\n          update: \"GET\",\n          data: $(this).sortable('serialize'),\n          failure: function() {\n            return alert(\"Problem sortable list menus\");\n          }\n        });\n      }\n    });\n  } else {\n    return false;\n  }\n});\n\nget_id_sortable = function(location_href) {\n  var get_page, regex_location_href;\n  regex_location_href = new RegExp(\"^.{1,}\\/(menus|contents|events|photos)$\", \"g\");\n  get_page = location_href.scan(regex_location_href);\n  if (get_page.length > 0) {\n    return `.${get_page[0][0]}`;\n  } else {\n    return false;\n  }\n};\n\nget_id_for_sortable_item = function(location_href) {\n  var get_page, regex_location_href;\n  regex_location_href = new RegExp(\"^.{1,}\\/(menus|contents|events|photos)$\", \"g\");\n  get_page = location_href.scan(regex_location_href);\n  if (get_page.length > 0) {\n    return $(`#${get_page[0][0]}_list`);\n  } else {\n    return $(\"\");\n  }\n};\n\nlocation_ajax = function(location_href) {\n  var get_page, regex_location_href;\n  regex_location_href = new RegExp(\"^.{1,}\\/(menus|contents|events|photos)$\", \"g\");\n  get_page = location_href.scan(regex_location_href);\n  if (get_page.length > 0) {\n    if (get_page[0][0] === 'menus') {\n      return \"/admin/menus/sorts\";\n    }\n    if (get_page[0][0] === 'contents') {\n      return `/admin/menus/${get_menu_id(location_href)}/contents/sorts`;\n    }\n    if (get_page[0][0] === 'photos') {\n      return `/admin/menus/${get_menu_id(location_href)}/photos/sorts`;\n    }\n    if (get_page[0][0] === 'events') {\n      return `/admin/menus/${get_menu_id(location_href)}/events/sorts`;\n    }\n  } else {\n    return false;\n  }\n};\n\nget_menu_id = function(location_href) {\n  var regex_location_href;\n  regex_location_href = new RegExp(\"^.{1,}\\/([0-9]+)\\/.{1,}$\", \"g\");\n  return location_href.scan(regex_location_href)[0][0];\n};\n\n\n//# sourceURL=webpack:///./js/admin/menus/index.js.coffee?");

/***/ }),

/***/ "./js/app.js":
/*!*******************!*\
  !*** ./js/app.js ***!
  \*******************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _css_app_scss__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../css/app.scss */ \"./css/app.scss\");\n/* harmony import */ var _css_app_scss__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_css_app_scss__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var phoenix_html__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! phoenix_html */ \"../deps/phoenix_html/priv/static/phoenix_html.js\");\n/* harmony import */ var phoenix_html__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(phoenix_html__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _vendors_scanjs_scan_js_coffee__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./vendors/scanjs/scan.js.coffee */ \"./js/vendors/scanjs/scan.js.coffee\");\n/* harmony import */ var _vendors_scanjs_scan_js_coffee__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_vendors_scanjs_scan_js_coffee__WEBPACK_IMPORTED_MODULE_2__);\n/* harmony import */ var _admin_contents_form_js_coffee__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./admin/contents/form.js.coffee */ \"./js/admin/contents/form.js.coffee\");\n/* harmony import */ var _admin_contents_form_js_coffee__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(_admin_contents_form_js_coffee__WEBPACK_IMPORTED_MODULE_3__);\n/* harmony import */ var _admin_menus_index_js_coffee__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./admin/menus/index.js.coffee */ \"./js/admin/menus/index.js.coffee\");\n/* harmony import */ var _admin_menus_index_js_coffee__WEBPACK_IMPORTED_MODULE_4___default = /*#__PURE__*/__webpack_require__.n(_admin_menus_index_js_coffee__WEBPACK_IMPORTED_MODULE_4__);\n// We need to import the CSS so that webpack will load it.\n// The MiniCssExtractPlugin is used to separate it out into\n// its own CSS file.\n // webpack automatically bundles all modules in your\n// entry points. Those entry points can be configured\n// in \"webpack.config.js\".\n//\n// Import dependencies\n//\n//\n//import \"../node_modules/ckeditor/ckeditor.js\"\n//import 'jquery';\n\n\n\n\n // Import local files\n//\n// Local files can be imported directly using relative paths, for example:\n// import socket from \"./socket\"\n\n//# sourceURL=webpack:///./js/app.js?");

/***/ }),

/***/ "./js/vendors/scanjs/scan.js.coffee":
/*!******************************************!*\
  !*** ./js/vendors/scanjs/scan.js.coffee ***!
  \******************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("String.prototype.scan = function(regex) {\n  var r;\n  r = new Array();\n  this.replace(regex, function() {\n    return r.push(Array.prototype.slice.call(arguments, 1, -2));\n  });\n  return r;\n};\n\n\n//# sourceURL=webpack:///./js/vendors/scanjs/scan.js.coffee?");

/***/ })

/******/ });