## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false,index: true|
### Association
- has_many :messages
- belongs_to :

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|title|text|null: false|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :messages_tags
- has_many  :tags,  through:  :messages_tags

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :messages_tags
- has_many  :messages,  through:  :messages_tags

## messages_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|messages_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :message
- belongs_to :tag

## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|messages_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :message
- belongs_to :user