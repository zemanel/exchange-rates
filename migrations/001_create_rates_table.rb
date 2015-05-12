Sequel.migration do
  up do
    create_table(:rates) do
      Date :date, :null=>false
      String :currency, :null=>false
      Float :rate, :null=>false
      primary_key [:date, :currency]
    end
  end

  down do
    drop_table(:rates)
  end

end
