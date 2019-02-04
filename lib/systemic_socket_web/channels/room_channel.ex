defmodule SystemicSocketWeb.RoomChannel do
  use SystemicSocketWeb, :channel
  alias SystemicSocket.Draw

  def join("room:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok,%{points: Draw.list_points}, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("create_point", %{"point" => point} = payload, socket) do
    case Draw.create_point(point) do
      {:ok, point} ->
        broadcast socket, "new_point", %{point: point}
        {:noreply, socket}
      {:error, changeset} -> {:reply, {:error, changeset},socket}
    end
  end

  def handle_in("destroy_points", _payload, socket) do
    Draw.delete_points
    broadcast socket, "erase", %{}
    {:noreply, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
