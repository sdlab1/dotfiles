local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
		return
	end
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
		return
	end
require("luasnip/loaders/from_vscode").lazy_load()
-- command :CmpStatus
cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
     window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	 },
    mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Esc>'] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
	  { name = 'treesitter' },
	  { name = 'tags' },
      { name = 'luasnip' },
	}, {
      { name = 'buffer' },
      { name = 'path' },
	  --{ name = 'cmdline' },
	  { name = 'nvim_lua' },
    }),
    completion = {
		completeopt = "menu,menuone,noselect"
	},
    formatting = {
		fields = {'menu', 'abbr', 'kind'},
		format = function(entry, vim_item)
		-- Kind icons
		--vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
		vim_item.menu = ({
			nvim_lsp = "lsp~",
			treesitter = "tree~",
			tags = "tags~",
			luasnip = "snip~",
			buffer = "buf~",
			path = "path~",
			cmdline = "cmd~",
		})[entry.source.name]
      return vim_item
    end,	
    },
	experimental = {
		ghost_text = true,
	},
  })

	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = false,
		float = true,
		})
	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
		vim.lsp.handlers.hover,
		{border = 'rounded'}
	)
	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{border = 'rounded'}
	)
require('mason').setup()
require('mason-lspconfig').setup()
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.quick_lint_js.setup({ capabilities = capabilities })
--lspconfig.denols.setup({ -- denols works perfectly BUT craps alot of memory 
--	capabilities = capabilities,
--	root_dir = lspconfig.util.root_pattern("deno.json"),
--})
lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
})
--lspconfig.eslint.setup({
    --on_attach = function(_, bufnr)
    --  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    --  vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
    --end,
--	root_dir = function()
--		return vim.fn.getcwd()
--	end,
--	capabilities = capabilities
--})
    -- `/` cmdline setup.
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
		{ name = 'path' }
    }, {
		{
			name = 'cmdline',
			option = {
			ignore_cmds = { 'Man', '!' }
			}
        }
      })
    })
