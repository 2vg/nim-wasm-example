# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import macros

macro EMSCRIPTEN_KEEPALIVE*(someProc: untyped): typed =
  result = someProc
  result.addPragma(newIdentNode("exportc"))
  when defined(cpp):
    result.addPragma(newNimNode(nnkExprColonExpr).add(
      newIdentNode("codegenDecl"),
      newLit("__attribute__((used)) extern \"C\" $# $#$#")))
  else:
    result.addPragma(newNimNode(nnkExprColonExpr).add(
      newIdentNode("codegenDecl"),
      newLit("__attribute__((used)) $# $#$#")))

proc fromNimFunction: int {.EMSCRIPTEN_KEEPALIVE.} =
  return 114514