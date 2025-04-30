local function pick_script()
  local pilot = require("package-pilot")

  local current_dir = vim.fn.getcwd()
  local package = pilot.find_package_file({ dir = current_dir })

  if not package then
    vim.notify("No package.json found", vim.log.levels.ERROR)
    return require("dap").ABORT
  end

  local scripts = pilot.get_all_scripts(package)

  local label_fn = function(script)
    return script
  end

  local co, ismain = coroutine.running()
  local ui = require("dap.ui")
  local pick = (co and not ismain) and ui.pick_one or ui.pick_one_sync
  local result = pick(scripts, "Select script", label_fn)
  return result or require("dap").ABORT
end

return {
  "mfussenegger/nvim-dap",
  dependencies = { "banjo/package-pilot.nvim" },
  opts = function(_, opts)
    local dap = require("dap")
    local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

    local current_file = vim.fn.expand("%:t")
    for _, language in ipairs(js_filetypes) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          name = "tsx (" .. current_file .. ")",
          type = "node",
          request = "launch",
          program = "${file}",
          runtimeExecutable = "tsx",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
          skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        },
        {
          type = "node",
          request = "launch",
          name = "Pick Script (yarn)",
          runtimeExecutable = "yarn",
          runtimeArgs = { "run", pick_script },
          cwd = "${workspaceFolder}",
        },
      }
    end
  end,
}
