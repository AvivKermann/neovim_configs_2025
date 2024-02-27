function ToggleComment()
    local comment_string = vim.api.nvim_buf_get_option(0, 'commentstring')

    if comment_string == '' or comment_string == nil then
        print('Error: commenstring is not defind for this buffer')
        return
    end

    local selected_lines = vim.api.nvim_buf_get_lines(0, vim.fn.line("'<") - 1, vim.fn.line("'>"), false)
    for i, line in ipairs(selected_lines) do
        if string.find(line, '^%s*' .. vim.pesc(comment_string)) then
            vim.api.nvim_buf_set_lines(0, vim.fn.line("'<") - 1 + i - 1, vim.fn.line("'<") - 1 + i, false,
                { string.gsub(line, '^%s*' .. vim.pesc(comment_string), '') })
        else
            vim.api.nvim_buf_set_lines(0, vim.fn.line("'<") - 1 + i - 1, vim.fn.line("'<") - 1 + i, false,
                { comment_string .. line })
        end
    end
end
