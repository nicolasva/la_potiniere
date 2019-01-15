defmodule LaPotiniereWeb.Service.AuthService do
  import Plug.Conn

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    user_id = get_session(conn, :user_id)
    user = user_id && repo.get(LaPotiniere.Users.User, user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def change_password(conn, current_password, password, confirmation_password, current_user, opts) do
    cond do
      checkpw(current_password, current_user.encrypted_password) ->
        check_new_password(conn, password, confirmation_password, current_user, opts)
      true ->
        dummy_checkpw()
        {:error, :current_password_error, conn}
    end
  end

  def check_new_password(conn, password, confirmation_password, current_user, opts) do
    cond do
      password == confirmation_password ->
        register_new_password(conn, password, current_user, opts)
      true ->
        {:error, :confirmation_password_error, conn}
    end
  end

  def register_new_password(conn, password, current_user, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = LaPotiniere.Repo.get(LaPotiniere.Users.User, current_user.id)
    encrypted_password = Comeonin.Bcrypt.hashpwsalt(password)
    user_update = LaPotiniere.Users.User.changeset(user, %{encrypted_password: encrypted_password})
    user_update = LaPotiniere.Repo.update user_update
    if user_update do
      user = repo.get_by(LaPotiniere.Users.User, encrypted_password: encrypted_password)
      assign(conn, :current_user, user)
      {:ok, conn}
    else
      {:error, :not_update, conn}
    end
  end

  def login_by_username_and_pass(conn, username, given_pass, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = LaPotiniere.Repo.get_by(LaPotiniere.Users.User, username: username)

    cond do
      user && checkpw(given_pass, user.encrypted_password) ->
        {:ok, login(conn, user)}
      user ->
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

  def send_mail(conn, user, password) do
    LaPotiniereWeb.Email.send_new_password_temporary_html(user.email, password) |> LaPotiniereWeb.Mailer.deliver_now
    conn
  end

  def losing_password(conn, email, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = repo.get_by(LaPotiniere.Users.User, email: email)

    cond do
      user ->
        {:ok, init_password(conn, user, opts)}
      true ->
        {:error, :not_found, conn}
    end
  end

  def init_password(conn, user, opts) do
    password = RandomBytes.base16(4)
    encrypted_password = Comeonin.Bcrypt.hashpwsalt(password)
    user_update = LaPotiniere.Users.User.changeset(user, %{encrypted_password: encrypted_password})
    user_update = LaPotiniere.Repo.update user_update
    repo = Keyword.fetch!(opts, :repo)
    user = repo.get_by(LaPotiniere.Users.User, email: user.email)
    send_mail(conn, user, password)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end
end
