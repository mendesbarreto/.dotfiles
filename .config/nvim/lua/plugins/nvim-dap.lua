return {
  "mfussenegger/nvim-dap",
  config = function()
    local Config = require("lazyvim.config")

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(Config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end

    local dap_ok, dap = pcall(require, "dap")
    if not dap_ok then
      print("nvim-dap not installed!")
      return
    end

    dap.set_log_level("INFO")
    dap.configurations = {
      go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
        {
          type = "go",
          name = "Debug test (go.mod)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}",
        },
        {
          type = "go",
          name = "Attach (Pick Process)",
          mode = "local",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
        {
          type = "go",
          name = "Attach (127.0.0.1:9080)",
          mode = "remote",
          request = "attach",
          port = "9080",
        },
      },
    }

    dap.adapters.go = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }
  end,
}
