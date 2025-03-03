defmodule Backdoor.Router do
  @moduledoc """
  Provides LiveView routing for Backdoor.
  """

  @doc """
  Defines a Backdoor route.

  It expects the `path` the backdoor will be mounted at
  and a set of options.

  ## Options

    * `:live_socket_path` - Configures the socket path. it must match
      the `socket "/live", Phoenix.LiveView.Socket` in your endpoint.

  ## Examples

      defmodule MyAppWeb.Router do
        use Phoenix.Router
        import Backdoor.Router

        scope "/", MyAppWeb do
          pipe_through [:browser]
          backdoor "/web_console"
        end
      end

  """
  defmacro backdoor(path, opts \\ []) do
    quote bind_quoted: binding() do
      scope path, alias: false, as: false do
        import Phoenix.LiveView.Router, only: [live: 4, live_session: 3]

        live_session :backdoor, root_layout: {Backdoor.LayoutView, :dash} do
          live "/", Backdoor.BackdoorLive, :backdoor, as: :backdoor
        end
      end
    end
  end
end
