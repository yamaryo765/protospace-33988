# テーブル設計

## usersテーブル


 | Column     | Type   | Options     |
 | ---------- | ------ | ----------- |
 | name       | string | null: false |
 | email      | string | null: false |
 | password   | string | null: false |
 | profile    | text   | null: false |
 | occupation | text   | null: false |
 | position   | text   | null: false |

### Association
- has_many :comments
- has_many :prototypes

## commentsテーブル

 | Column   | Type      | Options                       |
 | ------   | --------- | ----------------------------  |
 | text     | text      | null: false                    |
 | user     | reference | null: false, foreign_key: true|
 | prototype| reference | null: false, foreign_key: true|

 ### Association
 - belongs_to :user
 - belongs_to :prototype

 ## prototypeテーブル

 | Column        | Type      | Options                       |
 | ------------  | --------- | ----------------------------  |
 | catch_copy    | text      | nul:  false                   |
 | user          | reference | null: false, foreign_key: true|
 | title         | string    | null: false                   |
 | concept       | text      | null: false                   |
 
 ### Association
 - belongs_to :user
 - has_many :comments