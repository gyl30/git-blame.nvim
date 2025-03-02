local M = {}

M.default_opts = {
    enabled = true,
    date_format = "%c",
    message_template = "  <author> • <date> • <summary>",
    message_when_not_committed = "  Not Committed Yet",
    highlight_group = "Comment",
    set_extmark_options = {},
    display_virtual_text = true,
    ignored_filetypes = {},
    delay = 0,
    virtual_text_column = nil,
    use_blame_commit_file_urls = false,
}

M.setup = function(opts)
    opts = opts or {}
    opts = vim.tbl_deep_extend("force", M.default_opts, opts)

    for key, value in pairs(opts) do
        if vim.g["gitblame_" .. key] == nil or M.default_opts[key] ~= value then
            vim.g["gitblame_" .. key] = value
        end
    end
end

return M
