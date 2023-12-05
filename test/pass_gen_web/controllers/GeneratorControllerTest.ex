defmodule PassGenWeb.GeneratorControllerTest do
  use PassGenWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json") }
  end

  describe "generates a password" do
    test "generates password with only length passed", %{conn: conn} do
      conn = post(conn, Routes.page_path(conn, :generate), %{"length" => "5"})
      assert %{"password" => _pass} = json_response(conn, 200)
    end

    test "generates password with one options", %{conn: conn} do
      options = %{"length" => "5", "numbers" => "true"}
      conn = post(conn, Routes.page_path(conn, :generate), options)
      assert %{"password" => _pass} = json_response(conn, 200)
    end
  end

  describe "returns an error" do
    test "errors when no options is passed", %{conn: conn} do
      conn = post(conn, Routes.page_path(conn, :generate), %{})
      assert %{"error" => _error} = json_response(conn, 200)
    end

    test "error when length is not integer", %{conn: conn} do
      conn = post(conn, Routes.page_path(conn, :generate), %{"length" => "ab"})
      assert %{"error" => _error} = json_response(conn, 200)
    end

    test "error when other options are not boolean", %{conn: conn} do
      options = %{"length" => "5", "invalid" => "invalid"}
      conn = post(conn, Routes.page_path(conn, :generate), options)
      assert %{"error" => _error} = json_response(conn, 200)
    end

    test "error with non-valid option", %{conn: conn} do
      options = %{"length" => "5", "invalid" => "invalid"}
      conn = post(conn, Routes.page_path(conn, :generate), options)
      assert %{"error" => _error} = json_response(conn, 200)
    end
  end
end
