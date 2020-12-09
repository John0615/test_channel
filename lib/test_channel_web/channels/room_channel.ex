defmodule TestChannelWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    TestChannelWeb.Endpoint.subscribe("room")

    {:ok, socket}
  end
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    broadcast!(socket, "new_msg", %{body: body})
    {:noreply, socket}
  end

  # def handle_info("add_member", socket) do
  #   push(socket, "new_msg", %{id: 1, content: "hello"})
  #   reply(ref, {:ok, result})
  # {:noreply, socket}

  # end

  # def handle_info({:work_complete, result, ref}, socket) do
  #   reply(ref, {:ok, result})
  #   {:noreply, socket}
  # end

  def handle_info(params, socket) do
    IO.inspect(params, label: "92920wlowwo", pretty: true)
    # push(socket, "new_msg", %{id: 1, content: "hello"})
    broadcast!(socket, "new_msg",  %{id: 1, content: "hello"})

    {:noreply, socket}
  end
end
