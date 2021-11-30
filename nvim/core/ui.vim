function Light()
  colo alabaster-light
  hi DiffChange                       gui=none guifg=#cae2ff guibg=#3b4e66
  hi DiffText                         gui=bold guifg=#ffffff guibg=#325cc0
  hi DiffAdd                          gui=none guibg=#448c27 guifg=#ffffff
  hi diffAdded                        gui=none guibg=#448c27 guifg=#ffffff
  hi DiffDelete                       gui=none guibg=#aa3731 guifg=#ffffff
  hi diffRemoved                      gui=none guibg=#aa3731 guifg=#ffffff

  hi LspDiagnosticsDefaultError         guifg=Red ctermfg=Red
  hi LspDiagnosticsDefaultWarning       guifg=#660000 guibg=#ffdddd
  hi LspDiagnosticsDefaultInformation   guifg=#999999
  hi LspDiagnosticsDefaultHint          guifg=#009900
  hi LspDiagnosticsVirtualTextError     guifg=Red
  hi LspDiagnosticsUnderlineError       gui=underline guifg=fg guibg=none guisp=#000000
  hi LspDiagnosticsUnderlineWarning     gui=underline guifg=fg guibg=none guisp=#000000
  hi LspDiagnosticsUnderlineInformation gui=underline guifg=fg guibg=none guisp=#000000
  hi LspDiagnosticsUnderlineHint        gui=underline guifg=fg guibg=none guisp=#000000
  hi LspDiagnosticsFloatingError        guifg=Blue guibg=none
  hi LspDiagnosticsFloatingWarning      guifg=Blue guibg=none
  hi LspDiagnosticsFloatingInformation  guifg=Blue guibg=none
  hi LspDiagnosticsFloatingHint         guifg=Blue guibg=none
endfunction

function Dark()
  colo alabaster-dark

  hi DiffChange                         gui=none guifg=#cae2ff guibg=#3b4e66
  hi DiffText                           gui=bold guifg=#ffffff guibg=#0072ff
  hi DiffAdd                            gui=none guibg=#41592d guifg=#c5e6a9
  hi DiffDelete                         gui=none guibg=#663439 guifg=#e6757f

  " fugitive
  hi diffAdded                          gui=none guibg=#41592d guifg=#c5e6a9
  hi diffRemoved                        gui=none guibg=#663439 guifg=#e6757f

  " lsp
  hi LspDiagnosticsDefaultError         guifg=Red ctermfg=Red
  hi LspDiagnosticsDefaultWarning       guifg=#444400
  hi LspDiagnosticsDefaultInformation   guifg=#555555
  hi LspDiagnosticsDefaultHint          guifg=#00ff00
  hi LspDiagnosticsVirtualTextError     guifg=Red
  hi LspDiagnosticsUnderlineError       gui=underline guifg=fg guibg=none guisp=#ffff00
  hi LspDiagnosticsUnderlineWarning     gui=underline guifg=fg guibg=none guisp=#ffff00
  hi LspDiagnosticsUnderlineInformation gui=underline guifg=fg guibg=none guisp=#ffff00
  hi LspDiagnosticsUnderlineHint        gui=underline guifg=fg guibg=none guisp=#ffff00
  hi LspDiagnosticsFloatingError        guifg=Blue guibg=none
  hi LspDiagnosticsFloatingWarning      guifg=Blue guibg=none
  hi LspDiagnosticsFloatingInformation  guifg=Blue guibg=none
  hi LspDiagnosticsFloatingHint         guifg=Blue guibg=none
endfunction

let iterm_profile = $ITERM_PROFILE
if iterm_profile == "github"
  call Light()
else
  call Dark()
endif
