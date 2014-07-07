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
      t.string      :image_url, :default => 'http://media-cache-ec0.pinimg.com/736x/f3/c4/95/f3c4953524180f2b184642a693a91ccc.jpg'
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

    create_table :questions_surveys do |t|
      t.belongs_to    :survey
      t.belongs_to    :question
    end

    create_table :choices_rounds do |t|
      t.belongs_to    :round
      t.belongs_to    :choice
    end
  end
end
