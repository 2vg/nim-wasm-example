import macros

macro EMSCRIPTEN_KEEPALIVE(someProc: untyped) =
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

func fromNimFunction: int {.EMSCRIPTEN_KEEPALIVE.} =
  result = 114514
