App.board = App.cable.subscriptions.create "BoardChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    new_task = true
    $('#todo-list').find('.todo-row').each ->
      if (this.dataset.taskId is data["task"]['id'].toString())
        new_task = false
        $(this).before data["rendered_task"]
        this.parentNode.removeChild(this)
        return false
    $('#todo-list').append data["rendered_task"] if new_task

  speak: (task) ->
    @perform 'speak', task: task

  checked: (task) ->
    @perform 'checked', task: task

  unchecked: (task) ->
    @perform 'unchecked', task: task

$(document).on 'keypress', '[data-behavior~=board_speaker]', (event) ->
  if event.keyCode is 13
    App.board.speak event.target.value
    event.target.value = ''
    event.preventDefault()

$(document).on 'change', '.todo-checkbox', (event) ->
  if event.target.checked
    App.board.checked event.target.dataset.taskId
  else
    App.board.unchecked event.target.dataset.taskId
  event.preventDefault()
