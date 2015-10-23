{CompositeDisposable} = require 'atom'
proxy = require './services/symfony2-proxy.coffee'
config = require './config.coffee'
FileServiceProvider = require './providers/file-service-provider.coffee'

module.exports =
    config:
        console:
            title: 'Relative path to console file'
            description: 'Relative path to symfony2 console file (default app/console)'
            type: 'array'
            default: ['app/console']
            order: 1

    activate: ->
        config.init()
        @provider = new FileServiceProvider

    deactivate: ->

    getAutocompleteTools: (tools) ->
        proxy.providePhpProxy(tools.proxy)

    getProvider: ->
        return [@provider]
