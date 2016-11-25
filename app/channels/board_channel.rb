# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class BoardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "board_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Task.create! content: data['task']
  end

  def checked(data)
    task = Task.find(data['task'])
    task.update(completed: true)
  end
end
