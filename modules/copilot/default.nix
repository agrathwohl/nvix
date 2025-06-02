{ lib, ... }:
{
  plugins.copilot-lua = {
    enable = true;
    settings = {
      filetypes.markdown = true;
      suggestion = {
        enabled = true;
        auto_trigger = true;
      };
    };
  };

  plugins.copilot-chat.enable = true;

  plugins.codecompanion.enable = true;
  plugins.codecompanion.settings = {
  opts = {
    log_level = "TRACE";
    send_code = true;
    use_default_actions = true;
    use_default_prompts = true;
  };
  strategies = {
    agent = {
      adapter = "ollama";
    };
    chat = {
      adapter = "ollama";
    };
    inline = {
      adapter = "ollama";
    };
  };
  };

  plugins.avante.enable = false;
  plugins.avante = {
    settings = {
      mappings = {
        files = {
          add_current = "<leader>a.";
        };
      };
      claude = {
        endpoint = "https://api.anthropic.com";
        max_tokens = 4096;
        model = "claude-4-sonnet-latest";
        temperature = 0.1;
      };
      diff = {
        autojump = true;
        debug = false;
        list_opener = "copen";
      };
      highlights = {
        diff = {
          current = "DiffText";
          incoming = "DiffAdd";
        };
      };
      hints = {
        enabled = true;
      };
      mappings = {
        diff = {
          both = "cb";
          next = "]x";
          none = "c0";
          ours = "co";
          prev = "[x";
          theirs = "tc";
        };
      };
      provider = "claude";
      windows = {
        sidebar_header = {
          align = "center";
          rounded = true;
        };
        width = 30;
        wrap = true;
      };
    };
  };

  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
