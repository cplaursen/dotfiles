set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'rhysd/vim-color-spring-night'
Plug 'sjl/badwolf'
Plug 'folke/tokyonight.nvim'
Plug 'sainnhe/everforest'
Plug 'ericbn/vim-solarized'
Plug 'catppuccin/nvim'

"" Autocompletion
"Plug 'sirver/ultisnips'
"
"" Languages
Plug 'lervag/vimtex'
Plug 'elixir-editors/vim-elixir'
Plug 'neovim/nvim-lspconfig'
Plug 'dart-lang/dart-vim-plugin'

" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp', {'branch':'main'}
Plug 'hrsh7th/cmp-buffer', {'branch':'main'}
Plug 'hrsh7th/cmp-path', {'branch':'main'}
Plug 'hrsh7th/cmp-cmdline', {'branch':'main'}
Plug 'hrsh7th/nvim-cmp', {'branch':'main'}

" Snippets
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'jez/vim-better-sml'
"Plug 'jalvesaq/nvim-r'
"Plug 'sophacles/vim-processing'
"Plug 'jceb/vim-orgmode'
"Plug 'pbrisbin/vim-syntax-shakespeare'
"Plug 'eigenfoo/stan-vim'
"Plug 'wlangstroth/vim-racket'
"Plug 'felipesere/pie-highlight.vim' 
"Plug 'mlr-msft/vim-loves-dafny', {'for': 'dafny'}
"Plug 'edwinb/idris2-vim'
"Plug 'ionide/Ionide-vim'
"" Plug 'GCBallesteros/NotebookNavigator.nvim'
""
""" Tags
" Plug 'ludovicchabant/vim-gutentags'
"
"" For haskell
Plug 'rbgrouleff/bclose.vim'
Plug 'hasufell/ghcup.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mrcjkb/haskell-tools.nvim', {'version':'2'}
Plug 'pbrisbin/vim-syntax-shakespeare'
""
""" Better motions
"Plug 'easymotion/vim-easymotion'
""
""" tpope plugins
Plug 'tpope/vim-surround'
""
""" Status bar theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""
""" File manager
"Plug 'scrooloose/nerdtree'
""
""" Buffer navigation, use <Leader>b to open menu
"Plug 'jeetsukumaran/vim-buffergator'
""
""" Writing
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
"Plug 'reedes/vim-wordchipper'
"Plug 'rhysd/vim-grammarous'
"Plug 'vimwiki/vimwiki'
""
"Plug 'andy-morris/happy.vim'
"Plug 'andy-morris/alex.vim'
"
call plug#end()

" Setting up autocompletion
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert ({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<s-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select=true }),
      }),
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
    })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
EOF
