# Package

version       = "0.1.0"
author        = "momf"
description   = "example 'Nim to wasm'"
license       = "MIT"
srcDir        = "src"
bin           = @["nim_wasm_example"]


# Dependencies
requires "nim >= 1.0.4"


import distros

task installEmcc, "setup emscripten(install to <home directory>/emsdk)":
  exec "git clone https://github.com/emscripten-core/emsdk.git ~/emsdk"
  cd getEnv("HOME") & "/emsdk"
  exec "./emsdk install latest"
  exec "./emsdk activate latest"
  exec "source ~/emsdk/emsdk_env.sh"
  foreignDep "java" # ERROR: fatal: closure compiler is not configured correctly. java does not seem to exist, required for closure compiler.

task buildwasm, "build nim_wasm_example.nim":
  exec "nim c -d:release -d:emscripten -o:src/nim_wasm_example.js src/nim_wasm_example.nim"

task execwasm, "execute src/test.js":
  exec "node src/test.js"

task buildrun, "build and execute":
  exec "nimble buildwasm"
  exec "nimble execwasm"
