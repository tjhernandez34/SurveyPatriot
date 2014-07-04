class CreateSchema < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :name
      t.string      :email
      t.string      :password_hash
      t.timestamps
    end

    create_table :surveys do |t|
      t.string      :title
      t.integer     :user_id
      t.timestamps
    end

    create_table :questions do |t|
      t.string      :question
      t.timestamps
    end

    create_table :choices do |t|
      t.string      :choice
      t.integer     :question_id
      t.timestamps
    end

    create_table :rounds do |t|
      t.integer     :user_id
      t.integer     :survey_id
      t.timestamps
    end
  end
end
