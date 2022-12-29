local utils = {
    merge = function ()
    end,
    map = {}
}

function utils.merge(t1, t2)
    if next(t2) == nil then
        return t1
    end

    if next(t1) == nil then
        return t2
    end

    for k, v in pairs(t2) do
        if (type(v) == "table") and (type(t1[k] or false) == "table") then
            utils.merge(t1[k], t2[k])
        else
            t1[k] = v
        end
    end

    return t1
end

local function keymap(mode, keys, func, opt)
    vim.keymap.set(mode, keys, func, opt)
end

function utils.map.n(keys, func, opt)
    keymap('n', keys, func, opt)
end

function utils.map.v(keys, func, opt)
    keymap('v', keys, func, opt)
end

function utils.map.nv(keys, func, opt)
    keymap({'n', 'v'}, keys, func, opt)
end


local default_opts = { noremap = true, silent = true }

function utils.map.buffn(keys, func, opt)
    local merged_opt = utils.merge(default_opts, opt)
    keymap('n', keys, func, merged_opt)
end

function utils.map.buffv(keys, func, opt)
    local merged_opt = utils.merge(default_opts, opt)
    keymap('v', keys, func, merged_opt)
end

function utils.map.buffnv(keys, func, opt)
    local merged_opt = utils.merge(default_opts, opt)
    keymap('n', keys, func, merged_opt)
    keymap('v', keys, func, merged_opt)
end

return utils
