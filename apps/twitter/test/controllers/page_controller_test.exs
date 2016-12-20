defmodule Twitter.PageControllerTest do
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

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Twitter Client"
  end

  @tag :invalid_path
  test "GET /auth", %{conn: conn} do
    conn = get conn, "/auth"
    assert html_response(conn, 404) =~ "Page not found"
  end

end
