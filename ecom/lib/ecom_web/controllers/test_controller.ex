defmodule EcomWeb.TestController do
  use EcomWeb, :controller

  def test(conn, _params) do
    response = %{
      :statusCode => 200,
      :status => "Ok",
      :message => "api is working",
      :test => "helloo",
      hi: "hi"
    }
    conn
    |> put_status(200)
    |> json(response)
  end

end
