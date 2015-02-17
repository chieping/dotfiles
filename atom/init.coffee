# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

atom.workspaceView.eachEditorView (editorView) ->
  editorView.command 'my-command:yank', ->
    editorView.trigger('core:copy')
    editorView.trigger('vim-mode:yank')

# This is workaround for the issue that Atom is neglecting .bashrc.
# To confirm PATH environment variable, run `process.env['PATH']` in console.
# https://github.com/atom/atom/issues/3018
process.env['PATH'] = '/opt/boxen/rbenv/shims:/opt/boxen/rbenv/bin:/opt/boxen/rbenv/plugins/ruby-build/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/boxen/homebrew/bin:/opt/boxen/homebrew/sbin'
