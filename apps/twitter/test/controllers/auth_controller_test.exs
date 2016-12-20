defmodule Twitter.AuthControllerTest do
  use Twitter.ConnCase

  setup do

    current_user = %{
      name:   "testname",
      avatar: "imageurl",
      id:     "12345678",
      pid:    "12345"
    }

  end

  test "the truth" do
    assert 1 + 1 == 2
  end

  @tag :invalid_path
  test "GET /auth/twitter", %{conn: conn} do
    conn = delete conn, "/auth/twitter"
    assert html_response(conn, 404) =~ "Page not found"
  end

  @tag :invalid_path
  test "Wrong DELETE /logout", %{conn: conn} do
    conn = delete conn, "/logout"
    assert html_response(conn, 404) =~ "Page not found"
  end

  test "DELETE /auth/logout", %{conn: conn} do
    conn = delete conn, "/auth/logout"
    assert html_response(conn, 302) =~ "<html><body>You are being <a href=\"/\">redirected</a>.</body></html>"
  end

end
