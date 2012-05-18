ActiveRecord::Schema.define(:version => 0) do
  create_table :dumb_users, :force => true do |t|
    t.column "email", :string
    t.column "first_name", :string
    t.column "last_name", :string
  end

  create_table :non_validated_users, :force => true do |t|
    t.column "email", :string
  end

  create_table :user_with_non_existent_validated_attrs, :force => true do |t|
    t.column "email", :string
    t.column "first_name", :string
    t.column "last_name", :string
  end
end