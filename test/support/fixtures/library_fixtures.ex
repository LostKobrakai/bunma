defmodule Bunma.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bunma.Library` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> Bunma.Library.create_book()

    book
  end
end
