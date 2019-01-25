# Package

version       = "0.1.0"
author        = "momf"
description   = "example \"\"\x1B[DNim to wasm\"\x1B[C\x1B[C\x1B[C\x1B[C\x1B[C\x1B[C\x1B[C\x1B[C\x1B[C"
license       = "MIT"
srcDir        = "src"
bin           = @["nim_wasm_example"]


# Dependencies

requires "nim >= 0.19.0"

task installEmcc, "setup emscripten(install to <home directory>/emsdk)":
  exec "git clone https://github.com/emscripten-core/emsdk.git ~/emsdk"
  cd "~/emsdk"
  exec "./emsdk install latest"
  exec "./emsdk activate latest"
  exec "source ./emsdk_env.sh"

task buildwasm, "build nim_wasm_example.nim":
  exec "nim c -d:release -d:emscripten src/nim_wasm_example.nim"

task exec, "execute src/test.js":
  exec "node src/test.js"

task buildrun, "build and execute":
  exec "nim c -d:release -d:emscripten src/nim_wasm_example.nim"
  exec "node src/test.js"