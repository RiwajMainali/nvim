-- K that also documents C built-in operators (clangd has no hover for them).
-- On an operator in a c/cpp buffer: show a short note in a floating window.
-- Anywhere else: normal vim.lsp.buf.hover().
local M = {}

local ternary = {
  '`cond ? a : b`  conditional (ternary) operator',
  '',
  'Evaluates `cond`. If nonzero, the result is `a`; otherwise `b`.',
  'Only the chosen operand is evaluated.',
  'Precedence: just above assignment; right-associative.',
  '(C17 6.5.15)',
}

local docs = {
  ['?'] = ternary,
  [':'] = ternary,
  ['->'] = { '`p->m`  member access through pointer', '', 'Same as `(*p).m`.' },
  ['.'] = { '`s.m`  member access', '', 'Accesses member `m` of struct/union `s`.' },
  ['*'] = {
    '`*`  dereference / multiply / pointer declarator',
    '',
    'Unary `*p`: the object `p` points to.',
    'Binary `a * b`: multiplication.',
    'In a declaration `int *p`: `p` is a pointer to int.',
  },
  ['&'] = { '`&`  address-of / bitwise AND', '', 'Unary `&x`: address of `x`.', 'Binary `a & b`: bitwise AND.' },
  ['&&'] = { '`a && b`  logical AND', '', 'Result is 1 or 0. Short-circuits: `b` is not evaluated if `a` is 0.' },
  ['||'] = { '`a || b`  logical OR', '', 'Result is 1 or 0. Short-circuits: `b` is not evaluated if `a` is nonzero.' },
  ['!'] = { '`!a`  logical NOT', '', '1 if `a` is 0, else 0.' },
  ['~'] = { '`~a`  bitwise NOT', '', 'Flips every bit of `a` (after integer promotion).' },
  ['|'] = { '`a | b`  bitwise OR' },
  ['^'] = { '`a ^ b`  bitwise XOR' },
  ['<<'] = { '`a << n`  left shift', '', 'UB if `n` is negative or >= the width of the promoted `a`,', 'or if a signed `a` overflows.' },
  ['>>'] = { '`a >> n`  right shift', '', 'UB if `n` is negative or >= the width of the promoted `a`.', 'Negative signed `a`: implementation-defined.' },
  ['++'] = { '`++x` / `x++`  increment', '', 'Prefix yields the new value; postfix yields the old value.' },
  ['--'] = { '`--x` / `x--`  decrement', '', 'Prefix yields the new value; postfix yields the old value.' },
  ['%'] = { '`a % b`  remainder', '', 'Sign follows `a` (C99+). UB if `b` is 0.' },
  ['/'] = { '`a / b`  division', '', 'Integer division truncates toward zero. UB if `b` is 0.' },
  ['=='] = { '`a == b`  equality', '', 'Result is 1 or 0.' },
  ['!='] = { '`a != b`  inequality', '', 'Result is 1 or 0.' },
  ['='] = { '`a = b`  assignment', '', 'Result is the value stored in `a`. Right-associative.' },
  [','] = { '`a, b`  comma operator (in an expression)', '', 'Evaluates `a`, discards it, result is `b`.', '(In argument lists and declarations it is just a separator.)' },
}

-- Find the longest operator in `docs` that covers the cursor column.
local function op_under_cursor()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- 1-based
  for len = 2, 1, -1 do
    for s = col - len + 1, col do
      if s >= 1 then
        local tok = line:sub(s, s + len - 1)
        if #tok == len and docs[tok] then return tok end
      end
    end
  end
end

function M.hover()
  local ft = vim.bo.filetype
  local op = (ft == 'c' or ft == 'cpp') and op_under_cursor()
  if op then
    vim.lsp.util.open_floating_preview(docs[op], 'markdown', { border = 'rounded', focus_id = 'c-op-hover' })
  else
    vim.lsp.buf.hover()
  end
end

return M
