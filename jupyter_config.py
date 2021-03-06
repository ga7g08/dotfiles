# sample ipython_config.py
c = get_config()

c.TerminalIPythonApp.display_banner = False
c.InteractiveShellApp.log_level = 30
c.InteractiveShellApp.extensions = []
c.InteractiveShellApp.exec_lines = ['import numpy as np',
                                    'import matplotlib.pylab as plt'
                                   ]
c.InteractiveShellApp.exec_files = []
c.InteractiveShell.autoindent = True
c.InteractiveShell.colors = 'Linux'
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.editor = 'vim'
c.InteractiveShell.xmode = 'Context'

c.PromptManager.in_template  = 'In [\#]: '
c.PromptManager.in2_template = '   .\D.: '
c.PromptManager.out_template = 'Out[\#]: '
c.PromptManager.justify = True

c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [
         ('la', 'ls -al')
         ]

c.NotebookApp.browser = u'/usr/bin/google-chrome %s --new-window'
