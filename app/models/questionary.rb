# encoding: utf-8

class Questionary
  include Mongoid::Document

  COURSE_FORMATS = [
    "2 дня по 5-6 часов, платный",
    "2 раза в неделю в течение пары месяцев, бесплатный",
    "2 раза в неделю в течение пары месяцев, платный",
  ]

  YES_NO = %w(Да Нет)

  EXPIRIENCE = [
    "Лабораторные/курсовые/свои тренировочные проекты",
    "Работаю программистом меньше года",
    "Работаю программистом 1-3 года",
    "Работаю программистом 3-6 лет",
    "Работаю программистом больше 6-ти лет"
  ]

  field :user_id, type: Integer
  field :course_format
  field :ruby_knowledge
  field :nix_knowledge
  field :expirience
end
