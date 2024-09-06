---@meta

---@alias OptionsType "string"|"table"|"function"|"boolean"|"number"|"nil"

---@class FreezeOptions
---@field command OptionsType
---@field config OptionsType
---@field output table<OptionsType>
---@field window OptionsType
---@field padding table<OptionsType>
---@field margin table<OptionsType>
---@field background OptionsType
---@field theme OptionsType
---@field show_line_numbers OptionsType
---@field line_height OptionsType
---@field language OptionsType
---@field font table<string, OptionsType>
---@field shadow table<string, OptionsType>
---@field border table<string, OptionsType>

---@class Freeze
---@field required_options table<string, string>
---@field allowed_opts FreezeOptions
---@field parse_options fun(opts: FreezeOptions): FreezeOptions
---@field get_arguments fun(args: table<string, number>, options: FreezeOptions): table<string>
---@field format_lines fun(cmdline: table<string>, args: table<string, number>): table<string>, table<string>
---@field start fun(args: table<string, number>, options: FreezeOptions)
---@field setup fun(opts: FreezeOptions)
