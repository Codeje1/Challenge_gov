defmodule ChallengeGov.Messages.MessageContextStatus do
  @moduledoc """
  MessageContextStatus schema
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias ChallengeGov.Accounts.User
  alias ChallengeGov.Messages.MessageContext

  @type t :: %__MODULE__{}
  schema "message_context_statuses" do
    belongs_to(:context, MessageContext, foreign_key: :message_context_id)
    belongs_to(:user, User)

    field(:read, :boolean, default: false)
    field(:starred, :boolean, default: false)

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :read,
      :starred
    ])
  end

  def create_changeset(struct, user, context, params \\ %{}) do
    struct
    |> changeset(params)
    |> put_change(:user_id, user.id)
    |> put_change(:message_context_id, context.id)
    |> foreign_key_constraint(:user)
    |> foreign_key_constraint(:message_context)
  end
end
