
local root_dir = "config"

function Req(mod)
  local before = _BASE_PACKAGE
  if not _BASE_PACKAGE then
    _BASE_PACKAGE=root_dir.."."..mod
    local loaded = require(root_dir.."."..mod)
    _BASE_PACKAGE=before
    return loaded
  end

  local backup = _BASE_PACKAGE:match("(.*)[.]").."."..mod
  _BASE_PACKAGE=_BASE_PACKAGE.."."..mod
  local ok, loaded = pcall(require, _BASE_PACKAGE)
  if not ok then
    _BASE_PACKAGE=backup
    loaded = require(_BASE_PACKAGE)
    _BASE_PACKAGE=before
    return loaded
  end
  _BASE_PACKAGE=before
  return loaded
end

