RsenseClient = require './autocomplete-erlang-client.coffee'

module.exports =
class RsenseProvider
  id: 'autocomplete-erlang-erlangprovider'
  selector: '.source.erlang'
  rsenseClient: null

  constructor: ->
    @rsenseClient = new RsenseClient()

  requestHandler: (options) ->
    return new Promise (resolve) =>
      # rsense expects 1-based positions
      row = options.cursor.getBufferRow() + 1
      col = options.cursor.getBufferColumn() + 1
      completions = @rsenseClient.checkCompletion(options.editor,
      options.buffer, row, col, options.prefix, (completions) =>
        suggestions = @findSuggestions(options.prefix, completions)
        return resolve() unless suggestions?.length
        return resolve(suggestions)
      )

  findSuggestions: (prefix, completions) ->
    if completions?
      suggestions = []
      for completion in completions when completion.name isnt prefix
        kind = completion.kind.toLowerCase()
        word = completion.name
        count = parseInt(/\d*$/.exec(word)) || 0
        word = word.split("/")[0] + "("
        i = 0
        while ++i <= count then word += "${#{i}:#{i}}" + (if i != count then "," else ")") 

        suggestion =
          snippet: prefix.split(":")[0] + ":" + word.split("/")[0]
          prefix: prefix
          label: "#{kind} (#{completion.qualified_name})"
        suggestions.push(suggestion)
      return suggestions
    return []

  dispose: ->
