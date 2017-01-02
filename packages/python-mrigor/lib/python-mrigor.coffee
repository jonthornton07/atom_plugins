{CompositeDisposable} = require 'atom'

module.exports =
  config:
    executablePath:
      type: 'string'
      default: 'igor'
      description: 'Full path to binary (e.g. /usr/local/bin/igor)'

  activate: ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace',
      'python-mrigor:getimports': => @getimports()
      'python-mrigor:saveimports': => @saveimports()

    @subscriptions.add atom.workspace.observeTextEditors (editor)=>
      @subscriptions.add editor.onDidSave (event)=> @saveimports()

  deactivate: ->
    @subscriptions.dispose()

  saveimports: ->
    process = require('child_process')
    path = require('path')
    if editor = atom.workspace.getActiveTextEditor()
      execPath = atom.config.get('python-mrigor.executablePath')
      execCommand = execPath + ' --reap ' + editor.buffer.file.path
      process.exec execCommand, (code, stdout, stderr) ->
        console.log('Imports saved')

  getimports: ->
    process = require('child_process')
    path = require('path')
    if editor = atom.workspace.getActiveTextEditor()
      execPath = atom.config.get('python-mrigor.executablePath')

      execCommand = execPath + ' --print ' + editor.buffer.file.path
      process.exec execCommand, (code, stdout, stderr) ->
        editor.getBuffer().setText(stdout)
        console.log('Imports remembered')
