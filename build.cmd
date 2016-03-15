java -jar compiler.jar --language_in ECMASCRIPT5 --js src/domvm.js --js src/util.js --js src/view.js --js src/html.js --js src/watch.js --js src/route.js --js_output_file dist/domvm.min.js

java -jar compiler.jar --jscomp_off=uselessCode --language_in ECMASCRIPT5 --js src/polyfills/polyfills.js --js src/polyfills/polyfill.element.matches.js --js src/polyfills/request-frame.src.js --js src/polyfills/Promise.js --js src/polyfills/fetch.js --js_output_file dist/polyfills.min.js

java -jar compiler.jar --language_in ECMASCRIPT5 --js src/polyfills/fastclick.js --js_output_file dist/fastclick.min.js