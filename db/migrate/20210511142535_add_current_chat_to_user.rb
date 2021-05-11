class AddCurrentChatToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :chatting_with, :string
  end
end
