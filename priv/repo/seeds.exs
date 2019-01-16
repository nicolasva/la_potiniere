# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LaPotiniere.Repo.insert!(%LaPotiniere.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


role0 = %LaPotiniere.Roles.Role{role_value: 0}
role0 = LaPotiniere.Repo.insert!(role0)

role1 = %LaPotiniere.Roles.Role{role_value: 1}
role1 = LaPotiniere.Repo.insert!(role1)
