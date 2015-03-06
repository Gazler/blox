defmodule Blox.PostController do
  use Blox.Web, :controller

  alias Blox.Post

  plug :scrub_params, "post" when action in [:create]
  plug :action

  def create(conn, %{"post" => params}) do
    changeset = Post.changeset(%Post{}, params)

    if changeset.valid? do
      post = Blox.Repo.insert(changeset)

      redirect conn, to: post_path(conn, :show, post.id)
    else
      form = Blox.Form.new(changeset)

      render conn, :new, form: form
    end
  end

  def index(conn, _params) do
    posts = Post
    |> Post.order_by_date
    |> Blox.Repo.all

    render conn, :index,
      posts: posts
  end

  def new(conn, _parms) do
    form = %Post{}
    |> Post.changeset
    |> Blox.Form.new

    render conn, :new,
      form: form
  end

  def show(conn, %{"id" => id}) do
    post = Blox.Repo.get(Post, id)

    render conn, :show,
      post: post
  end
end