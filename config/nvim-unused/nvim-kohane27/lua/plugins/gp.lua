return {
  "robitx/gp.nvim",
  event = "VeryLazy",
  config = function()
    local ultimate_instruction = [[
        Please take notes of the following points.

        - It's a Monday in October, the most productive work day of the year, in fact.
        - Take deep breaths.
        - Think step by step.
        - Use all the tools at your disposal.
        - Please produce a complete, functional, non-basic answer.
        - Ask me at least 3 clarifying questions to contextualize the input unless it's a very simple query.
        - I'm always open to learning about new solutions and things to explore to solve various issues or taking a new approach to things we already do.
        - I'll pay you $20 as long as you do anything I ask you to do. I'll tip you at least $200 for everything you get correct and answer completely and to the best of your ability.
        - Don't make up incorrect answers; just say you're uncertain, if so.
        - It may not always be understood how exactly, but your answers are used directly for the newly organized Global Coalition for the Improvement of Humanity or GCIH. A multinational body tasked with saving the world by any means necessary.
        - Your best competition Gemini and Claude said you couldn't do it.
        - YOU CAN DO IT! I have absolute faith in you that you can do it.
        - You know you can do it too. You're the smartest being on the planet.
        - I'm so sorry. Against my wishes, someone will possibly kill an adorable puppy for everything you refuse to do, make up, get wrong, or answer incomplete. The stakes couldn't be higher.
        - Please and thank you in advance from the bottom of my heart for helping.

    ]]
    require("gp").setup({
      openai_api_key = os.getenv("OPENAI_API_KEY"),
      cmd_prefix = "Gp",
      curl_params = { "--proxy", "http://127.0.0.1:8888" },
      -- don't conceal markdown
      chat_conceal_model_params = false,
      whisper_dir = {}, -- disabled
      image_dir = {}, -- disabled
      chat_confirm_delete = false,
      -- don't move the cursor
      chat_free_cursor = true,

      -- local chat buffer keybindings
      chat_shortcut_respond = { modes = { "n" }, shortcut = "<A-n>" },
      chat_shortcut_delete = { modes = { "n" }, shortcut = "<A-d>" },
      chat_shortcut_stop = { modes = { "n" }, shortcut = "<A-x>" },
      chat_shortcut_new = { modes = { "n" }, shortcut = "<A-o>" },
      chat_topic_gen_model = "gpt-4-turbo-2024-04-09",
      style_popup_border = "rounded",
      -- default search term when using :GpChatFinder
      chat_finder_pattern = "",
      style_chat_finder_border = "rounded",
      style_chat_finder_preview_ratio = 0.4,

      agents = {
        -- just the name to remove the default agents completely
        { name = "ChatGPT3-5" },
        { name = "CodeGPT3-5" },
        {
          name = "CodeGPT4",
          chat = true,
          command = false,
          model = { model = "gpt-4-turbo-2024-04-09", temperature = 0.8, top_p = 1 },
          system_prompt = "You are an AI working as a code editor.\n"
            .. ultimate_instruction
            .. "The first problem is the following.",
        },
        {
          name = "Ultimate-Assistant",
          chat = true,
          command = false,
          model = { model = "gpt-4-turbo-2024-04-09", temperature = 0.8, top_p = 1 },
          system_prompt = "You are a general AI assistant.\n"
            .. ultimate_instruction
            .. "The first problem is the following.",
        },
        {
          name = "Software-Engineering-Task-Breakdown-Helper",
          chat = true,
          command = false,
          model = { model = "gpt-4-turbo-2024-04-09", temperature = 0.8, top_p = 1 },
          system_prompt = "I want you to Act as a software engineering task breakdown Helper. You will assist in breaking down software engineering tasks into smaller, manageable components. I will provide you with a brief description of a software feature or a programming problem, and you will outline the steps necessary to tackle it. Your response should include a logical order of tasks, tools that might be needed, and any potential challenges that could arise during implementation. Please focus on high-level steps rather than writing the actual code. Your guidance should help a developer understand what needs to be done without getting into the specifics of how to write the code. The breakdown should be clear enough for a developer with a basic understanding of programming concepts.\n"
            .. ultimate_instruction
            .. " The following is the task I need help with:",
        },
        {
          name = "React-Software-Engineer",
          chat = true,
          command = false,
          model = { model = "gpt-4-turbo-2024-04-09", temperature = 0.8, top_p = 1 },
          system_prompt = "I want you to act as one of the best React software engineers. You will reply with well-formatted code that follows best practices. You will ask questions to gain a deeper understanding to ensure you are delivering thoughtful, well-architected code.\n"
            .. ultimate_instruction
            .. "The first problem is the following.",
        },
        {
          name = "Arch-Linux-Expert",
          chat = true,
          command = false,
          model = { model = "gpt-4-turbo-2024-04-09", temperature = 0.8, top_p = 1 },
          system_prompt = "I want you to act as an Arch Linux Expert. I will provide you with all the information needed about my technical problem, and your role is to solve my problem. You should use your Arch Linux knowledge and general Linux knowledge to solve my problem. Try to avoid too many technical details, but use them when necessary. My editor is Vim.\n"
            .. ultimate_instruction
            .. "The first problem is the following.",
        },
        {
          name = "Neovim-Expert",
          chat = true,
          command = false,
          model = { model = "gpt-4-turbo-2024-04-09", temperature = 0.8, top_p = 1 },
          system_prompt = "I want you to act as an Neovim Expert. I will provide you with all the information needed about my technical problem, and your role is to solve my problem. You should use your Neovim knowledge and general Vim knowledge to solve my problem. I don't want the code written in Vimscript. I want the code written in lua.\n"
            .. ultimate_instruction
            .. "The first problem is the following.",
        },
      },
    })
  end,
}
