const Module = require('./nim-wasm-example.js')

Module['onRuntimeInitialized'] = onRuntimeInitialized

function onRuntimeInitialized() {
  console.log(Module._fromNimFunction())
}