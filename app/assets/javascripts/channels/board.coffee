App.board = App.cable.subscriptions.create "BoardChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert data['task']

  speak: (task) ->
    @perform 'speak', task: task

$(document).on 'keypress', '[data-behavior~=board_speaker]', (event) ->
  if event.keyCode is 13
    App.board.speak event.target.value
    event.target.value = ''
    event.preventDefault()
