const Module = require('./nim_wasm_example.js')

Module['onRuntimeInitialized'] = onRuntimeInitialized

function onRuntimeInitialized() {
  console.log(Module._fromNimFunction())
}
