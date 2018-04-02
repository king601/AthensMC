class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_conversations
    create_conversation_users
    create_messages
  end

  private

  def create_conversations
    create_table :conversations do |t|
      t.text :last_message_content
      t.integer :messages_count

      t.timestamps
    end
  end

  def create_conversation_users
    create_table :conversation_users do |t|
      t.references :conversation, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :last_read_at

      t.timestamps
    end
  end

  def create_messages
    create_table :messages do |t|
      t.references :conversation, foreign_key: true
      t.references :user
      t.text :content

      t.timestamps
    end
  end
end
