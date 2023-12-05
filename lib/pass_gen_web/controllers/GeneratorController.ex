defmodule PassGenWeb.GeneratorController do
  use Phoenix.Controller

  @spec generate(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def generate(conn, %{"password" => password_params}) do
    # password_length = [
    #   Weak: Enum.map(6..15, & &1),
    #   Strong: Enum.map(16..88, & &1),
    #   Unbelievable: [100, 150]
    # ]
    {:ok, password} = PassGenerator.generate(password_params);

    json(conn, password)
  end
end
