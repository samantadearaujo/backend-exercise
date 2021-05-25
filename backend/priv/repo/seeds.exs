# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Backend.Repo.insert!(%Backend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Backend.Repo.insert!(%Backend.Accounts.Order{
  amount: 1,
  item_order: ["d3c0523d-1c81-44dd-8601-3e45fcb432b6", "a65a3408-209e-4cd6-8b06-4db4342ce7c2"],
  user_id: "2e8da33b-5c5c-4206-89ae-d9642016596b"
})
