defmodule DedMagicsApi.Repo.Migrations.MagicTable do
  use Ecto.Migration

  def change do
    create table(:magics) do
      add(:name, :varchar, null: false)
      add(:book, :varchar, null: false)
      add(:school, :varchar, null: false)
      add(:casting_time, :varchar, default: "action")
      add(:material, :text)
      add(:buff_description, :text)
      add(:description, :text, null: false)
      add(:level, :integer, null: false)
      add(:range, :float, null: false, comment: "In meters")
      add(:components, {:array, :text}, null: false)
      add(:ritual, :boolean, default: false)
      add(:concentration, :boolean, default: false)
    end

    create(
      constraint(
        :magics,
        :ckeck_level,
        check: "level >= 0 AND level <= 9"
      )
    )

    create(
      constraint(
        :magics,
        :check_components,
        check: "
        ARRAY_LENGTH(components, 1) >= 1
        and ARRAY_LENGTH(components, 1) <= 3
        and components <@ ARRAY['M', 'V', 'S']
      "
      )
    )

    create(
      constraint(
        :magics,
        :check_book,
        check: "book IN ('livro_do_jogador')"
      )
    )

    create(
      constraint(
        :magics,
        :check_school,
        check: "school IN (
        'abjuration',
        'alteration',
        'conjuration',
        'divination',
        'enchantment',
        'illusion',
        'invocation',
        'necromancy'
      )"
      )
    )
  end
end
