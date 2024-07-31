Vim�UnDo� ۶�o\�m�l�#\	���E>��Qpa�3Y�=��   l               --                                f�g    _�                     ,       ����                                                                                                                                                                                                                                                                                                                                                             f�f)    �   n               �         o      	"hrsh7th/nvim-cmp",   	event = "InsertEnter",   	dependencies = {   4		-- Snippet Engine & its associated nvim-cmp source   		{   			"L3MON4D3/LuaSnip",   			build = (function()   :				-- Build Step is needed for regex support in snippets.   ?				-- This step is not supported in many windows environments.   :				-- Remove the below condition to re-enable on windows.   F				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then   					return   				end   "				return "make install_jsregexp"   
			end)(),   			dependencies = {   B				-- `friendly-snippets` contains a variety of premade snippets.   M				--    See the README about individual language/framework/plugin snippets:   9				--    https://github.com/rafamadriz/friendly-snippets   				-- {   (				--   'rafamadriz/friendly-snippets',   				--   config = function()   =				--     require('luasnip.loaders.from_vscode').lazy_load()   				--   end,   					-- },   			},   		},   		"saadparwaiz1/cmp_luasnip",�      *   o      (		-- Adds other completion capabilities.   H		--  nvim-cmp does not ship with all sources by default. They are split   3		--  into multiple repos for maintenance purposes.   		"hrsh7th/cmp-nvim-lsp",   		"hrsh7th/cmp-path",   	},   	config = function()   		-- See `:help cmp`   		local cmp = require("cmp")   $		local luasnip = require("luasnip")   		luasnip.config.setup({})�   *   2   o      		cmp.setup({   			snippet = {   				expand = function(args)   "					luasnip.lsp_expand(args.body)   				end,   			},   :			completion = { completeopt = "menu,menuone,noinsert" },�   2   <   o   	   5			-- For an understanding of why these mappings were   :			-- chosen, you will need to read `:help ins-completion`   			--   O			-- No, but seriously. Please read `:help ins-completion`, it is really good!   (			mapping = cmp.mapping.preset.insert({   				-- Select the [n]ext item   /				["<C-n>"] = cmp.mapping.select_next_item(),   !				-- Select the [p]revious item   /				["<C-p>"] = cmp.mapping.select_prev_item(),�   <   @   o      9				-- Scroll the documentation window [b]ack / [f]orward   ,				["<C-b>"] = cmp.mapping.scroll_docs(-4),   +				["<C-f>"] = cmp.mapping.scroll_docs(4),�   @   E   o      %				-- Accept ([y]es) the completion.   6				--  This will auto-import if your LSP supports it.   <				--  This will expand snippets if the LSP sent a snippet.   9				--["<Tab>"] = cmp.mapping.confirm({ select = true }),�   E   K   o      9				-- If you prefer more traditional completion keymaps,   ,				-- you can uncomment the following lines   6				["<CR>"] = cmp.mapping.confirm({ select = true }),   /				["<Tab>"] = cmp.mapping.select_next_item(),   1				["<S-Tab>"] = cmp.mapping.select_prev_item(),�   K   P   o      3				-- Manually trigger a completion from nvim-cmp.   D				--  Generally you don't need this, because nvim-cmp will display   A				--  completions whenever it has completion options available.   -				["<C-Space>"] = cmp.mapping.complete({}),�   P   c   o      G				-- Think of <c-l> as moving to the right of your snippet expansion.   -				--  So if you have a snippet that's like:   				--  function $name($args)   				--    $body   				--  end   				--   K				-- <c-l> will move you to the right of each of the expansion locations.   5				-- <c-h> is similar, except moving you backwards.   &				["<C-l>"] = cmp.mapping(function()   1					if luasnip.expand_or_locally_jumpable() then   						luasnip.expand_or_jump()   					end   				end, { "i", "s" }),   &				["<C-h>"] = cmp.mapping(function()   )					if luasnip.locally_jumpable(-1) then   						luasnip.jump(-1)   					end   				end, { "i", "s" }),�   c   n   o   
   V				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:   H				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps   			}),   			sources = {   				{ name = "nvim_lsp" },   				{ name = "luasnip" },   				{ name = "path" },   			},   		})   	end,�   n               5��    n                                             �    c       	      	      �            N      �    P                   �
      G      �      �    K                   �	      �       �       �    E                   �      �       �       �    @                   �      �       �       �    <                   H      k       �       �    2                   �      d      �      �    *                	         n       �       �           
      
      �      H      p      �                              v      ,      �    n                      �                     5�_�                    9       ����                                                                                                                                                                                                                                                                                                                                                             f�fZ     �   8   :   n      7            ["<C-n>"] = cmp.mapping.select_next_item(),5��    8                                          5�_�                    9       ����                                                                                                                                                                                                                                                                                                                            9          9          v       f�fo     �   8   :   n      ;            ["<DownC-n>"] = cmp.mapping.select_next_item(),5��    8                                          �    8                                        5�_�                    9       ����                                                                                                                                                                                                                                                                                                                            9          9          v       f�fv     �   8   :   n      =            ["<DownC00-n>"] = cmp.mapping.select_next_item(),5��    8                                          5�_�                    ;       ����                                                                                                                                                                                                                                                                                                                            9          9          v       f�f{     �   :   <   n      7            ["<C-p>"] = cmp.mapping.select_prev_item(),5��    :                    k                    5�_�                    H       ����                                                                                                                                                                                                                                                                                                                            9          9          v       f�f�     �   G   I   n      >            ["<CR>"] = cmp.mapping.confirm({ select = true }),5��    G                    �
                    5�_�                    I       ����                                                                                                                                                                                                                                                                                                                            9          9          v       f�f�     �   H   I          7            ["<Tab>"] = cmp.mapping.select_next_item(),5��    H                      �
      8               5�_�      	              I       ����                                                                                                                                                                                                                                                                                                                            9          9          v       f�f�    �   H   I          9            ["<S-Tab>"] = cmp.mapping.select_prev_item(),5��    H                      �
      :               5�_�      
           	   @        ����                                                                                                                                                                                                                                                                                                                            9          9          v       f�f�     �   ?   A   l       5��    ?                      ?	                     �    ?                     O	                     �    ?                     N	                     5�_�   	              
   @       ����                                                                                                                                                                                                                                                                                                                            9          9          v       f�f�    �   ?   @                      \us5��    ?                      ?	                     5�_�   
                          ����                                                                                                                                                                                                                                                                                                                                                             f�g    �         l                  --   �         k    5��                                               �                         +                     �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         .                     �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                         -                     �                        ,                    �                        ,                    �                        0                    �                        0                    �                     	   0             	       �              	          0      	              �                        0                    �                        0                    �                     	   0             	       �              	       	   0      	       	       �              	       	   0      	       	       �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �                         3                     �                         2                     �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     
   0             
       �              	           1      	               �                     
   0             
       �              	           1      	               �                     
   0             
       �              	           1      	               �                     
   0             
       �              	           1      	               �                     
   0             
       �              	           1      	               �                     
   0             
       �              	           1      	               �                     
   0             
       �              	           1      	               �                        0                    �              
           1      
               �                     
   0             
       �              	           1      	               �                     
   0             
       �                         9                     �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �                         3                     �                         2                     �                         1                     �                     
   0             
       �              	           1      	               �                     
   0             
       �              	           1      	               �                     
   0             
       �              	           1      	               �                     
   0             
       �              	           1      	               �                     
   0             
       �              	           1      	               �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �                         3                     �                         2                     �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         6                     �                         5                     �                         4                     �                         3                     �                         2                     �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �                         3                     �                         2                     �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                     	   0             	       �                         1                     �                     	   0             	       �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �                         3                     �                         2                     �                         1                     �                     	   0             	       �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                     	   0             	       �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �                         3                     �                         2                     �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         2                     �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                     	   0             	       �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �                         3                     �                         2                     �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    �                         1                     �                        0                    5��