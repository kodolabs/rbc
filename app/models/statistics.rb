class Statistics
  def languages
    @languages ||= begin
      Questionary::LANGUAGES.inject({}) do |result, language|
        result[language] = Questionary.by_language(language).count
        result
      end
    end
  end

  def experience
    @experience ||= begin
      Questionary::EXPERIENCE.inject({}) do |result, experience|
        result[experience] = Questionary.by_experience(experience).count
        result
      end
    end
  end

  def count
    @count ||= Questionary.count
  end
end
