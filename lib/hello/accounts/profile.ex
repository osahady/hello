defmodule Hello.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  alias Hello.Accounts.User

  schema "profiles" do
    field :first_name, :string
    field :last_name, :string
    field :father_name, :string
    field :mother_name, :string
    field :dob, :string
    field :id_no, :string
    field :type, :string
    belongs_to :user, User

    timestamps()
  end

  @required_fields ~w(first_name last_name father_name mother_name id_no dob type)a
  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
