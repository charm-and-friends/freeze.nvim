{vimUtils, ...}:
vimUtils.buildVimPlugin {
  name = "charm-freeze";
  src = ./.;
}
