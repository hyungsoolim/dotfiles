-- 스페이스를 기본 리더 키로 사용합니다.
vim.g.mapleader = " "

-- netrw 파일 탐색기 상단 배너를 숨깁니다.
vim.g.netrw_banner = 0

-- 현재 줄의 절대 번호를 표시합니다.
vim.opt.nu = true

-- 현재 줄 기준 상대 줄 번호를 표시합니다.
vim.opt.relativenumber = true

-- 탭 문자의 화면 표시 너비를 4칸으로 설정합니다.
vim.opt.tabstop = 4

-- 편집 중 탭 입력/삭제가 4칸처럼 동작하게 합니다.
vim.opt.softtabstop = 4

-- 자동 들여쓰기와 `>>`, `<<` 이동 폭을 4칸으로 설정합니다.
vim.opt.shiftwidth = 4

-- 탭 입력을 실제 탭 문자 대신 공백으로 변환합니다.
vim.opt.expandtab = true

-- 긴 줄을 화면 폭에 맞춰 자동 줄바꿈하지 않습니다.
vim.opt.wrap = false

-- 새 줄을 만들 때 이전 줄의 문맥을 보고 들여쓰기를 보정합니다.
vim.opt.smartindent = true

-- 치환 명령 결과를 별도 split 창에서 미리 봅니다.
vim.opt.inccommand = "split"

-- 가로 split을 열 때 새 창을 아래에 배치합니다.
vim.opt.splitbelow = true

-- 세로 split을 열 때 새 창을 오른쪽에 배치합니다.
vim.opt.splitright = true

-- 검색할 때 기본적으로 대소문자를 구분하지 않습니다.
vim.opt.ignorecase = true

-- 검색어에 대문자가 있으면 대소문자를 구분합니다.
vim.opt.smartcase = true

-- 상태줄을 창마다 나누지 않고 화면 하단에 하나만 표시합니다.
vim.opt.laststatus = 3

-- swap 파일을 만들지 않습니다.
vim.opt.swapfile = false

-- 백업 파일을 만들지 않습니다.
vim.opt.backup = false

-- undo 기록 파일을 저장할 디렉터리를 지정합니다.
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"

-- Neovim을 다시 열어도 undo 기록을 유지합니다.
vim.opt.undofile = true

-- 자동완성 메뉴 표시 방식과 정렬 방식을 설정합니다.
vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"

-- 자동완성 관련 안내 메시지를 줄여 command line을 덜 어지럽게 합니다.
vim.opt.shortmess:append("c")

-- 시스템 클립보드와 Neovim unnamedplus 레지스터를 연결합니다.
vim.opt.clipboard:append("unnamedplus")

-- 파일명 인식 문자에 `@-@` 패턴을 추가합니다.
vim.opt.isfname:append("@-@")

-- GUI 커서 모양 변경
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- 커서 위아래로 최소 8줄의 여백을 유지합니다.
vim.opt.scrolloff = 8

-- 세로 기준선 표시를 끕니다.
vim.opt.colorcolumn = "0"

-- sign column을 항상 표시해서 진단/마커로 인한 화면 흔들림을 줄입니다.
vim.opt.signcolumn = "yes"

-- 텍스트를 yank할 때 선택 영역을 잠깐 하이라이트합니다.
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})

-- 외부에서 변경된 파일을 Neovim으로 돌아올 때 다시 불러옵니다.
vim.api.nvim_create_autocmd({ "FocusGained", "TermLeave" }, {
    desc = "Reload files changed outside Neovim",
    command = "checktime",
})
