# encoding: utf-8

class Questionary
  include Mongoid::Document
  include Mongoid::Timestamps

  LANGUAGES = [
    'C / C++',
    'C#',
    'Java',
    'PHP',
    'Python',
    'Ruby'
  ]

  EXPERIENCE = [
    'нет опыта',
    'меньше года',
    '1-2 года',
    '3-6 лет',
    'больше 6-ти лет'
  ]

  field :user_id, type: Integer
  field :languages, type: Array
  field :experience, type: Array
end
